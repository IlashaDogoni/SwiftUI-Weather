//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Ilya Kokorin on 23.08.2024.
//

import SwiftUI

struct WeatherButton: View{
    var title: String
    var backgroungColor: Color
    var textColor: Color
    
    var body: some View{
        Text(title)
            .frame(width: 260, height: 50)
            .background(backgroungColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .medium, design: .rounded))
            .cornerRadius(10)
    }
}
