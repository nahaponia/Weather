//
//  WeatherObject.swift
//  Weather
//
//  Created by Maxim  on 3/20/18.
//  Copyright © 2018 Maxim. All rights reserved.
//

import Foundation

struct WeatherInfo: Decodable {
    
    let weather: [Weather]
    let mainInfo: MainInfo?
    let systemInfo: SystemInfo?
    
    enum CodingKeys: String, CodingKey {
        
        case weather = "weather"
        case mainInfo = "main"
        case systemInfo = "sys"
    }
}

struct Weather: Decodable {
    
    let parameters: String?
    let description: String?
    let icon: String?
    
    enum CodingKeys: String, CodingKey {
        
        case parameters = "main"
        case description = "description"
        case icon = "icon"
    }
}

struct MainInfo: Decodable {
    
    let humidity: Double?
    let temp: Double?
    let pressure: Double?
    let temp_min: Double?
    let temp_max: Double?
}

struct SystemInfo: Decodable {
    let country: String?
}
