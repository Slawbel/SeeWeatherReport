import SwiftUI

struct CustomModalView: View {
    @Binding var showModal: Bool
    @Binding var city: String
    @ObservedObject var api: ApiViewModel

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
                        print(currentWeather.cityName)
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
    CustomModalView(showModal: .constant(true), city: .constant("New York"), api: ApiViewModel())
}
