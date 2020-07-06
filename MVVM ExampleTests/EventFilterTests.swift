//
//  EventsTests.swift
//  Teste-Dev-iOS-Woop-SicrediTests
//
//  Created by Rodrigo Giglio on 11/06/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import XCTest
@testable import Teste_Dev_iOS_Woop_Sicredi

class EventFilterTests: XCTestCase {
    
    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {

    }

    func testEventEmptyFilter() throws {

        /// Given
        let viewModel = EventListViewModel()
        viewModel.allEvents = testEvents
        
        /// When
        viewModel.showldDisplaySearch = true
        viewModel.filter = String.empty
        
        /// Then
        XCTAssertTrue(viewModel.events.count == 0)
        
    }
    
    func testEventNilFilterShowldNotDisplay() throws {

        /// Given
        let viewModel = EventListViewModel()
        viewModel.allEvents = testEvents
        
        /// When
        viewModel.showldDisplaySearch = false
        viewModel.filter = nil
        
        /// Then
        XCTAssertTrue(viewModel.events.count == 2)
        
    }
    
    func testEventNilFilterShowldDisplay() throws {

        /// Given
        let viewModel = EventListViewModel()
        viewModel.allEvents = testEvents
        
        /// When
        viewModel.showldDisplaySearch = true
        viewModel.filter = nil
        
        /// Then
        XCTAssertTrue(viewModel.events.count == 0)
        
    }
    
    func testEventFilter() throws {

        /// Given
        let viewModel = EventListViewModel()
        viewModel.allEvents = testEvents
        
        /// When
        viewModel.showldDisplaySearch = true
        viewModel.filter = "feira de adoção"
        
        /// Then
        XCTAssertTrue(viewModel.events.count == 1)
        XCTAssertTrue(viewModel.events[0].id == "1")

    }


    // MARK: - Test Variables
    let testEvents = [
        Event(id: "1", people: [Person(id: "1", eventId: "1", name: "name 1", picture: "picture 1")], date: Date(), description: "Event 1 Description", image: "http://lproweb.procempa.com.br/pmpa/prefpoa/seda_news/usu_img/Papel%20de%20Parede.png", longitude: -51.2146267, latitude: -30.0392981, price: 29.99, title: "Feira de adoção de animais na Redenção", cupons: [Cupon(id: "1", eventId: "1", discount: 62)]),
        Event(id: "1", people: [Person(id: "1", eventId: "1", name: "name 2", picture: "picture 2")], date: Date(), description: "Event 2 description", image: "http://fm103.com.br/wp-content/uploads/2017/07/campanha-do-agasalho-balneario-camboriu-2016.jpg", longitude: -51.2148497, latitude: -30.037878, price: 59.99, title: "Doação de roupas", cupons: [Cupon(id: "2", eventId: "2", discount: 30)])
    ]
}
