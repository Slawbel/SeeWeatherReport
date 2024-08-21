import SwiftUI

struct ContentView: View {
    @State private var showCustomModal = false
    @State private var city = ""
    @State private var temperature = ""
    @State private var feelsLikeTemperature = ""
    @State private var weatherIconImageView: UIImage? = nil
    
    
    @ObservedObject var api = ApiViewModel()
    
    var body: some View {
        ZStack {
            HStack {
                Text(city)
                Button(action: {
                    showCustomModal = true
                }) {
                    Text("Get weather")
                }
            }
            .zIndex(0)
            
            if showCustomModal {
                CustomModalView(showModal: $showCustomModal, city: $city, api: api, updateInterface: { weather in
                    self.updateInterface(weather: weather)
                })
                    .frame(width: 300, height: 200)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 10)
                    .transition(.scale)
                    .zIndex(1)
            }
        }
        .animation(.easeInOut, value: showCustomModal)
        .edgesIgnoringSafeArea(.all)
        
        
    }
    
    func updateInterface(weather: CurrentWeather) {
        self.city = weather.cityName
        self.temperature = weather.temperatureString
        self.feelsLikeTemperature = weather.feelsLikeTemperatureString
        self.weatherIconImageView = UIImage(systemName: weather.systemIconNameString)
    }
}



#Preview {
    ContentView()
}
