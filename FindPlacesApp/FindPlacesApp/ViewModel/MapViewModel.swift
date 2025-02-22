//
//  MapViewModel.swift
//  FindPlacesApp
//
//  Created by Evelyn Callista Yaurentius on 22/02/25.
//

import Foundation
import SwiftUI

class MapViewModel: ObservableObject {
    @Published var mapImage: UIImage? = nil

    func fetchMapImage(longitude: Double, latitude: Double, zoom: Int = 9, width: Int = 300, height: Int = 200) {
        let apiKey = Bundle.main.mapboxAPIKey
        let urlString = "https://api.mapbox.com/styles/v1/mapbox/streets-v12/static/\(longitude),\(latitude),\(zoom),0/\(width)x\(height)?access_token=\(apiKey)"

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.mapImage = image
                }
            } else {
                print("Failed to fetch map image: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
}
