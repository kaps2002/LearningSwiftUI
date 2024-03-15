//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Roro on 13/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight: Bool = true
    var body: some View {
        ZStack{
            LinearGradient(colors: isNight ? [.blue, Color("lightblue")]: [.black, .gray], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                Text("New Delhi")
                    .foregroundStyle(.white)
                    .font(.system(size: 36, weight: .medium, design: .default))
                    .padding()
                VStack(spacing: 5){
                    Text("MON")
                        .foregroundStyle(isNight ? .black : .white)
                        .font(.system(size: 24, weight: .medium, design: .default))
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("31°C")
                        .font(.system(size: 40, weight: .medium, design: .default))
                        .foregroundStyle(.white)
                    
                }
                HStack(spacing: 25){
                    WeatherDayView(day: "TUE", symbol: "sun.max.fill", temperature: 35)
                    WeatherDayView(day: "WED", symbol: "sun.max.fill", temperature: 36)
                    WeatherDayView(day: "THU", symbol: "cloud.fill", temperature: 30)
                    WeatherDayView(day: "FRI", symbol: "cloud.rain.fill", temperature: 25)
                    WeatherDayView(day: "SAT", symbol: "cloud.sun.fill", temperature: 30)
                    
                }.padding(.top, 70)
                
                Button{
                    isNight.toggle()
                }
                label: {
                    Text(isNight ? "Dark Mode" : "Light Mode")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .frame(width: 280, height: 60)
                        .background(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 50)
                
            }
                
        
        }
        
    }
}

struct WeatherDayView: View {
    var day: String
    var symbol: String
    var temperature: Int
    
    var body: some View{
        VStack{
            Text(day)
                .fontWeight(.medium)
                .foregroundStyle(.white)
            Image(systemName: symbol)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 60)
            Text("\(temperature)°C")
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    ContentView()
}
