//
//  Weather.swift
//  Trail Blaze
//
//  Created by Udani Fernando on 09/12/2024.
//

struct WeatherData: Codable {
    let main: Main
    let weather: [Weather]
    let name: String
    
    struct Main: Codable {
        let temp: Double
    }
    
    struct Weather: Codable {
        let description: String
    }
}
