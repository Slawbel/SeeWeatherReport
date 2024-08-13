import SwiftUI

struct ContentView: View {
    @ObservedObject var api = ApiViewModel()
    
    var body: some View {
        VStack {
            Button(action: {
                self.citySearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { city in
                    self.api.fetchWeatherAPIRequest(forCity: city)
                }
            }) {
                Text("Get weather")
            }
        }
    }
}

#Preview {
    ContentView()
}
