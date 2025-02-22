//
//  LocationSearchViewModel.swift
//  FindPlacesApp
//
//  Created by Evelyn Callista Yaurentius on 22/02/25.
//

import Foundation

class LocationSearchViewModel: ObservableObject {
    @Published var searchResults: [(name: String, latitude: Double, longitude: Double)] = []

    let apiKey = Bundle.main.mapboxAPIKey

    func searchLocation(query: String) {
        guard let queryEncoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        let urlString = "https://api.mapbox.com/geocoding/v5/mapbox.places/\(queryEncoded).json?access_token=\(apiKey)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let decodedResponse = try JSONDecoder().decode(MapboxGeocodingResponse.self, from: data)
                DispatchQueue.main.async {
                    self.searchResults = decodedResponse.features.map {
                        ($0.place_name, $0.center[1], $0.center[0])
                    }
                }
            } catch {
                print("Failed to decode response:", error)
            }
        }.resume()
    }
}


