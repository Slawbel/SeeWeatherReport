//
//  ContentView.swift
//  SeeWeatherReport
//
//  Created by Viacheslav Belov on 07.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var city = ""
    
    @ObservedObject var api = ApiViewModel()
    
    var body: some View {
        let weatherImageView:UIImageView!
        let placeLabel: UILabel!
        let temperLabel: UILabel!
        let feelsLikeTemperLabel: UILabel!
        
        VStack {
            TextField("Enter a city name", text: $city)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button(action: {
                if self.city != nil {
                    api.fetchWeatherAPIRequest(forCity: city)
                }
            }) {
                Text("Get weather")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
