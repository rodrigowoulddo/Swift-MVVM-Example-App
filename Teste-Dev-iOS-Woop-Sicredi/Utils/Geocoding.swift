//
//  Geocoding.swift
//  Teste-Dev-iOS-Woop-Sicredi
//
//  Created by Rodrigo Giglio on 13/06/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

struct Place {
    
    let street: String?
    let number: String?
    let city: String?
    let state: String?
    let country: String?
    
    var formattedAddress: String {
        
        var formattedAddress = ""
        if let street = street { formattedAddress += "\(street), " }
        if let number = number { formattedAddress += "\(number), " }
        if let city = city { formattedAddress += "\(city)-" }
        if let state = state { formattedAddress += "\(state), " }
        if let country = country { formattedAddress += "\(country)" }
        
        return formattedAddress
    }
}

class Geocoding {
    
    public static func getPlace(_ latitude: Double, _ longitude: Double, completion: @escaping (Place?) -> Void) {
        
        let address = CLGeocoder.init()
        
        address.reverseGeocodeLocation(CLLocation.init(latitude: latitude, longitude: longitude)) {
            (places, error) in
            
            guard let clPlace = places?[0], error == nil
            else {
                completion(nil)
                return
            }
             
            debugPrint(clPlace)
            
            let place = Place(street: clPlace.thoroughfare, number: clPlace.subThoroughfare, city: clPlace.locality, state: clPlace.administrativeArea, country: clPlace.country)
            completion(place)
        }
    }
    
    public static func openMap(_ latitude: Double, _ longitude: Double, pinName: String? = nil) {
        
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
        mapItem.name = pinName
        mapItem.openInMaps()

    }
}
