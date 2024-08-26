//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Ilya Kokorin on 23.08.2024.
//

import SwiftUI

struct ContentView: View, WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        
        self.weather = weather
        print("City: \(weather.cityName), Temperature: \(weather.temperature)")
        self.nameOfCity = weather.cityName
        print(self.nameOfCity)
    }
    
    func didFailedWithError(error: any Error) {
        print("Error fetching weather: \(error)")
    }
    
    
    @State private var isNight = false
    @State private var nameOfCity = "Somewhere in Russia"
    var weatherManager = WeatherManager()
    @State var weather: WeatherModel?
    
    
    init() {
           weatherManager.delegate = self
        
       }
    
    var body: some View {
        
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack{
                
                CityTextView(cityName: nameOfCity)
                
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 20)
                
                HStack(spacing: 25){
                    ForEach(sampleWeatherData, id: \.dayOfWeek) {weather in
                        WeatherDayView(dayOfWeek: weather.dayOfWeek, imageName: weather.imageName, temperature: weather.temperature)
                    }
                }
                Spacer()
                
                Button{
                    weatherManager.fetchWeather(cityName: "Moscow")
         //           if let weather = weather{
         //               nameOfCity = weather.cityName
          //          } else {
          //              nameOfCity = "Nowhere"
           //         }
                } label: {
                    WeatherButton(title: "Moscow Weather",
                                  backgroungColor: .white,
                                  textColor: .blue)
                }
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  backgroungColor: .white,
                                  textColor: .blue)
                }
                
                Spacer()
            }
        }
     }
   
}



#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek:   String
    var imageName:   String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 22, weight: .medium, design: .rounded))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 26, weight: .medium, design: .rounded))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .yellow,
                                                   isNight ? .nightBlue : .blue,
                                                   isNight ? .nightBlue : .blue,
                                                   isNight ? .gray : .lightBlue]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View{
    
    var cityName: String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .rounded))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherView: View{
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .padding()
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium, design: .rounded))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 70 )
    }
}

