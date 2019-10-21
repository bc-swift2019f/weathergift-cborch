//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Carter Borchetta on 10/20/19.
//  Copyright © 2019 Carter Borchetta. All rights reserved.
//

import Foundation
import Alamofire

class WeatherLocation {
    var name = ""
    var coordinates = ""
    
    func getWeather() {
        let weatherURL = urlBase + urlAPIKey + coordinates
        print(weatherURL)
        
        Alamofire.request(weatherURL).responseJSON { response in
            print(response)
            
        }
    }
}


