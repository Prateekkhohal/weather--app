//
//  ContentView.swift
//  weather--app
//
//  Created by Prateek Kumar on 19/11/23.
//

import SwiftUI

struct ContentView: View {
     
    @State private var isNight = false
    
    var weatherdata : [(day : String, image:String , temp: Int)] = [("MON","sun.max.fill",76),
                                                                    ("TUE","cloud.sun.fill",74),
                                                                    ("WED","wind",67),
                                                                    ("THU","moon.stars.fill",78),
                                                                    ("FRI","cloud.bolt.fill",72),
                                                                    ("SAT","snowflake",24)]
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack{
                Spacer()
                CityTextView(cityName: "DELHI,IN")
                mainWeatherView(Mainweatherimage: isNight ? "moon.fill" : "cloud.sun.fill", MainTemp: 77)
                
                HStack(spacing:20){
                    WeatherDayView(dayOfWeek: weatherdata[0].day,
                                   imageName: weatherdata[0].image,
                                        temp: weatherdata[0].temp)
                    WeatherDayView(dayOfWeek: weatherdata[1].day,
                                   imageName: weatherdata[1].image,
                                        temp: weatherdata[1].temp)
                    WeatherDayView(dayOfWeek: weatherdata[2].day,
                                   imageName: weatherdata[2].image,
                                        temp: weatherdata[2].temp)
                    WeatherDayView(dayOfWeek: weatherdata[3].day,
                                   imageName: weatherdata[3].image,
                                        temp: weatherdata[3].temp)
                    WeatherDayView(dayOfWeek: weatherdata[4].day,
                                   imageName: weatherdata[4].image,
                                        temp: weatherdata[4].temp)
                    WeatherDayView(dayOfWeek: weatherdata[5].day,
                                   imageName: weatherdata[5].image,
                                        temp: weatherdata[5].temp)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                }label:{
                    WeatherButton(title: "Change Day Time", backcolor: .white, forecolor: .blue, radius: 10)
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
    
    var dayOfWeek: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system (size: 20,weight: .medium,design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system (size: 22,weight: .medium,design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight : Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .white: Color("lightblue")]), startPoint: .topLeading,endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
    }
}

struct CityTextView: View{
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system (size: 32,weight: .medium,design: .default))
            .foregroundColor(.white)
    }
}

struct mainWeatherView: View{
    var Mainweatherimage: String
    var MainTemp: Int
    var body: some View{
        
        VStack(spacing: 8){
            
            Image(systemName: Mainweatherimage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height:180)
            Text("\(MainTemp)°")
                .font(.system(size: 70,weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom,80)
        
    }
}
struct WeatherButton: View{
    var title:String
    var backcolor : Color
    var forecolor : Color
    var radius : CGFloat
    
    var body: some View{
        Text(title)
            .font(.system(size: 20,weight: .bold,design: .default))
            .frame(width:280,height:50)
            .background(backcolor)
            .foregroundColor(forecolor)
            .cornerRadius(radius)
    }
}
