import SwiftUI

extension ContentView {
    func citySearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        let alertContr = UIAlertController(title: title, message: message, preferredStyle: style)
        alertContr.addTextField { tf in
            let cities = ["Moscow", "San Francisco", "New York", "Stambul", "Vienna"]
            tf.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = alertContr.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "$20")
                completionHandler(cityName)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertContr.addAction(search)
        alertContr.addAction(cancel)
        //present(alertContr, animated: true, completion: nil)
    }
}
