//
//  WeatherManager.swift
//  SwiftUI-Weather
//
//  Created by Ilya Kokorin on 24.08.2024.
//

import Foundation

protocol WeatherManagerDelegate{
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailedWithError(error: Error)
}

struct WeatherManager{
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=cffe8f2301ea1150eeb83964531603cd&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    public func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    /*func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString  = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    } */
    
    func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    delegate?.didFailedWithError(error: error!)
                    print("Error : \(error)")
                    return
                }
                if let safeData = data{
                    print(String(data: safeData, encoding: .utf8) ?? "No data")
                    if let weather = parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                        print("perform request message. Data has been parsed and weather is up to date")
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
        let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temperature = decodedData.main.temp
            let name =  decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temperature)
            return weather
           
        } catch {
            delegate?.didFailedWithError(error: error)
            print("No parsing done")
            return nil
        }
    }
    
    
    
}
