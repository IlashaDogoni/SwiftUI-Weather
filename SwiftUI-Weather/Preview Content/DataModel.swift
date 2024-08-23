//
//  DataModel.swift
//  SwiftUI-Weather
//
//  Created by Ilya Kokorin on 23.08.2024.
//

import Foundation

struct WeatherDay{
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
}

let sampleWeatherData: [WeatherDay] = [
    WeatherDay(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 20),
    WeatherDay(dayOfWeek: "WED", imageName: "cloud.sun.bolt.fill", temperature: 16),
    WeatherDay(dayOfWeek: "THU", imageName: "cloud.heavyrain.fill", temperature: 11),
    WeatherDay(dayOfWeek: "FRI", imageName: "sun.max.fill", temperature: 28),
    WeatherDay(dayOfWeek: "SAT", imageName: "cloud.drizzle.fill", temperature: 20)
]
