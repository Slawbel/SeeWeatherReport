import SwiftUI

struct ContentView: View {
    @State private var showCustomModal = false
    @State private var city = ""

    @ObservedObject var api = ApiViewModel()

    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    showCustomModal = true
                }) {
                    Text("Get weather")
                }
            }
            if showCustomModal {
                CustomModalView(showModal: $showCustomModal, city: $city, api: api)
                    .frame(width: 300, height: 200) 
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 10)
                    .transition(.scale)
            }
        }
    }
}

#Preview {
    ContentView()
}
