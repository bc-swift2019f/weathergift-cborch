//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Carter Borchetta on 10/28/19.
//  Copyright © 2019 Carter Borchetta. All rights reserved.
//

import Foundation

class WeatherLocation {
    var name: String
    var coordinates: String
    
    init(name: String, coordinates:String) {
        self.name = name
        self.coordinates = coordinates
    }
    
}
