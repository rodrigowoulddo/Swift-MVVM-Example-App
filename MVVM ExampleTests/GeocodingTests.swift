//
//  GeocodingTests.swift
//  Teste-Dev-iOS-Woop-SicrediTests
//
//  Created by Rodrigo Giglio on 13/06/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import XCTest
@testable import Teste_Dev_iOS_Woop_Sicredi

class GeocodingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSimplePlaceFromCoordinates() throws {

        Geocoding.getPlace(from: -23.550520, and: -46.633308) {
            (place) in
            
            XCTAssertNotNil(place)
        }
    }



}
