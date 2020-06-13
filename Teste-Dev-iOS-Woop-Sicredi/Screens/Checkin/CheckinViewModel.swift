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
}

class CheckinViewModel {
    
    // MARK: - Attributes
    weak var delegate: CheckinViewModelDelegate?
    let service = Service<CheckinEndpoints>()
    var event: Event?
    
    var name: String?
    var email: String?
    var cupon: String?
    
    // MARK: - Public Methods
    public func checkin(name: String?, email: String?) {
        
        self.name = name
        self.email = email
        
        if validateFields() {
            requestLogin()
        }
    }
    
    public func applyCupon(_ cupon: String?) {
        
        self.cupon = cupon

        guard let event = event else { return }
        
        let validCupon = event.cupons.filter({ $0.id == cupon }).first
        
        /// Checks if cupon is valid
        if let validCupon = validCupon {
            
            let adjustedPrice = applyDiscount(validCupon.discount, atPrice: event.price)
            delegate?.didApplyCuppon(oldPrice: "R$ \(event.price)", newPrice: "R$ \(adjustedPrice.formatted)")
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
        
        let checkinInput = CheckinInput(eventId: eventId, name: name, email: email)
        
        service.request(.checkin(input: checkinInput)) {
            (result: Result<String,Error>) in
            
            switch result {
                
            case .failure(let error):
                self.delegate?.showAlert(title: "Erro", message: "Não foi possível realizar o checkin")
                print(error.localizedDescription)
                
            case .success(_):
                self.delegate?.didCheckin()
                
            }
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
}
