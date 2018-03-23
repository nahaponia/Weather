//
//  WeatherForecast.swift
//  Weather
//
//  Created by Maxim  on 3/21/18.
//  Copyright © 2018 Maxim. All rights reserved.
//

import Foundation

struct Forecast: Decodable {
    
    let list: [ForecastInfo]
    let city: City
    
}

struct ForecastInfo: Decodable {
    
    let date: String?
    let main: MainInfo
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case date = "dt_txt"
        case main = "main"
        case weather = "weather"
    }
}

struct City: Decodable {
    
    let name: String?
    
}


