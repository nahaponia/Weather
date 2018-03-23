//
//  WeatherMap.swift
//  Weather
//
//  Created by Maxim  on 3/19/18.
//  Copyright © 2018 Maxim. All rights reserved.
//

import UIKit

class GetWeather {
    
    
    class func fiveDaysForecast(completed: @escaping (Forecast?) -> Void ) {
        
        var components = URLComponents(string: ApiURL.fiveDaysForecast)!
        
        components.queryItems = [
            URLQueryItem(name: "id", value: "5368361"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid", value: "576b40e8056d9852d0966139c421fc18")
        ]
        
        
        let url = URLRequest(url: components.url!)
       
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            var cast: Forecast?
            guard let data = data else { return }
            
            do {
                let forecast = try JSONDecoder().decode(Forecast.self, from: data)
                cast = forecast
                completed(cast)
            } catch (let error) {
                print("Error serializing json: - ", error)
            }
            
        }.resume()
    }
    
    
}
