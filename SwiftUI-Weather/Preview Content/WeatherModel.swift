//
//  WeatherModel.swift
//  SwiftUI-Weather
//
//  Created by Ilya Kokorin on 24.08.2024.
//

import Foundation

struct WeatherModel{
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String{
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String{
        switch conditionId {
        case 200...202:
            return "cloud.bolt.rain"
        case 210...221:
            return "cloud.bolt"
        case 230...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...501:
            return "cloud.rain"
        case 502...531:
            return "cloud.heavyrain"
        case 600...622:
            return "cloud.snow"
        case 700...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        default:
            return "ladybug"
        }
    }
}
