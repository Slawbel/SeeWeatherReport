import SwiftUI

struct CustomModalView: View {
    @Binding var showModal: Bool
    @Binding var city: String
    @ObservedObject var api: ApiViewModel
    var updateInterface: (CurrentWeather) -> Void

    var body: some View {
        VStack {
            Text("Enter city name")
                .font(.headline)
                .padding()

            TextField("City", text: $city)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            HStack {
                Button(action: {
                    showModal = false
                }) {
                    Text("Cancel")
                }
                .padding()
                
                Button(action: {
                    api.fetchWeatherAPIRequest(forCity: city)
                    api.onCompletion = { currentWeather in
                        updateInterface(currentWeather)
                        showModal = false
                    }
                }) {
                    Text("Search")
                }
                .padding()
            }
        }
        .padding()
    }
}

#Preview {
    CustomModalView(showModal: .constant(true), city: .constant("Prague"), api: ApiViewModel(), updateInterface: {_ in })
}
