import SwiftUI

class ApiViewModel: ObservableObject {
    
    var urlString: String
    var url: URL?
    var session: URLSession
    
    init() {
        self.urlString = ""
        self.url = nil
        self.session = URLSession(configuration: .default)
    }
    
    func fetchWeatherAPIRequest(forCity city: String?) {
        guard let city = city else { return }
        self.urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
 
        guard let url = URL(string: urlString) else { return }
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let dataString = String(data: data, encoding: .utf8)
                print(dataString!)
            } else if let error = error {
                print("Request error: \(error)")
            }
        }
        task.resume()
    }
}
