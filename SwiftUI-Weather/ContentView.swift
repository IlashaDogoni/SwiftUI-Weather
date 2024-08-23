//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Ilya Kokorin on 23.08.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(color1: .yellow, color2: .blue, color3: .blue, color4: .white)
            
            VStack{
                CityTextView(cityName: "Omsk, Russia")
                
                MainWeatherView(imageName: "cloud.sun.fill", temperature: 20)
                
                HStack(spacing: 25){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 20)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "cloud.sun.bolt.fill",
                                   temperature: 16)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "cloud.heavyrain.fill",
                                   temperature: 11)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sun.max.fill",
                                   temperature: 28)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "cloud.drizzle.fill",
                                   temperature: 20)
                }
                Spacer()
                
                Button{
                    print("tapped")
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
    var color1: Color
    var color2: Color
    var color3: Color
    var color4: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .blue,  .blue, .lightBlue]),
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

