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
            LinearGradient(gradient: Gradient(colors: [.yellow, .blue,  .blue, .lightBlue]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Omsk, Russia")
                    .font(.system(size: 32, weight: .medium, design: .rounded))
                    .foregroundStyle(.white)
                    .padding()
                VStack(spacing: 10) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .padding()
                    Text("20°")
                        .font(.system(size: 70, weight: .medium, design: .rounded))
                        .foregroundStyle(.white)
                }
                .padding(.bottom, 70 )
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
                    Text("Change Day Time")
                        .frame(width: 260, height: 50)
                        .background(.white)
                        .font(.system(size: 20, weight: .medium, design: .rounded))
                        .cornerRadius(10)
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
