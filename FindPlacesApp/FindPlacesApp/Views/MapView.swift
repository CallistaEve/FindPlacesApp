//
//  MapView.swift
//  FindPlacesApp
//
//  Created by Evelyn Callista Yaurentius on 22/02/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    let latitude: Double
    let longitude: Double
    let zoom: Int
    let width: Int
    let height: Int
    
    // Generate the Mapbox Static Image URL
    var mapImageURL: String {
        let apiKey = Bundle.main.mapboxAPIKey
        return "https://api.mapbox.com/styles/v1/mapbox/streets-v12/static/\(longitude),\(latitude),\(zoom),0/\(width)x\(height)?access_token=\(apiKey)"
    }
    
    var body: some View {
        VStack {
            Text("Map Location")
                .font(.headline)
            
            AsyncImage(url: URL(string: mapImageURL)) { phase in
                switch phase {
                case .empty:
                    ProgressView() // Show loading indicator
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: CGFloat(width), height: CGFloat(height))
                        .cornerRadius(10)
                case .failure:
                    Image(systemName: "exclamationmark.triangle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.red)
                @unknown default:
                    EmptyView()
                }
            }
        }
        .padding()
    }
}

