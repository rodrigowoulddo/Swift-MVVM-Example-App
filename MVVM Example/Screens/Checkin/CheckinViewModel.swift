//
//  CheckinViewModel.swift
//  Teste-Dev-iOS-Woop-Sicredi
//
//  Created by Rodrigo Giglio on 13/06/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation

protocol CheckinViewModelDelegate: class {
    func showAlert(title: String, message: String)
    func invalidateName()
    func invalidateEmail()
    func invalidateCupon()
    func didApplyCuppon(oldPrice: String, newPrice: String)
    func didCheckin()
    func stopLoading()
    func startLoading()
}

class CheckinViewModel {
    
    // MARK: - Attributes
    weak var delegate: CheckinViewModelDelegate?
    let service = Service<CheckinEndpoints>()
    var event: Event?
    
    var name: String?
    var email: String?
    
    // MARK: - Public Methods
    public func checkin(name: String?, email: String?) {
        
        self.name = name
        self.email = email
        
        if validateFields() {
            requestLogin()
        }
    }
    
    public func applyCupon(_ cupon: String?) {
        
        guard let event = event else { return }
        
        let validCupon = validateCupon(cupon, on: event)
        
        /// Checks if cupon is valid
        if let validCupon = validCupon {
            
            let adjustedPrice = applyDiscount(validCupon.discount, atPrice: event.price)
            delegate?.didApplyCuppon(oldPrice: PriceFormatter.format(event.price), newPrice: PriceFormatter.format(adjustedPrice))
        }
        else {
            
            delegate?.invalidateCupon()
        }
    }
    
    
    // MARK: - Private Methods
    private func requestLogin() {
        
        guard
            
            let eventIdString = event?.id,
            let eventId = Int(eventIdString),
            let name = name,
            let email = email
            
        else { return }
        
        delegate?.startLoading()
        
        let checkinInput = CheckinInput(eventId: eventId, name: name, email: email)
        
        service.request(.checkin(input: checkinInput)) {
            (result: Result<CheckinResponse,Error>) in
            
            switch result {
                
            case .failure(let error):
                self.delegate?.showAlert(title: "Erro", message: "Não foi possível realizar o checkin.")
                print(error.localizedDescription)
                
            case .success(let checkinResponse):
                
                if checkinResponse.code == "200" {
                    self.delegate?.didCheckin()
                }
                else {
                    self.delegate?.showAlert(title: "Erro", message: "Não foi possível realizar o checkin.")
                }
            }
            
            self.delegate?.stopLoading()
        }
    }
    
    private func validateFields() -> Bool {
                
        var areInformationsValid = true
        
        /// Checks if name exists
        if let name = name, name.count > 3 { } else {
            delegate?.invalidateName()
            areInformationsValid = false
        }
        
        /// Checks if email exists
        if let email = email {
            
            /// Checks if email is valid
            if !Validator.validateEmail(email) {
                delegate?.invalidateEmail()
                areInformationsValid = false
            }
            
        } else {
            delegate?.invalidateEmail()
            areInformationsValid = false
        }
        
        return areInformationsValid
    }
    
    private func applyDiscount(_ discount: Double, atPrice price: Double) -> Double {
        return (discount * price)/100
    }
    
    private func validateCupon(_ cupon: String?, on event: Event) -> Cupon? {
        
        guard let cupon = cupon else { return  nil }
        return event.cupons?.filter({ $0.id == cupon }).first
    }
}
