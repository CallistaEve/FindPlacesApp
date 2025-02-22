//
//  LocationDetailView.swift
//  FindPlacesApp
//
//  Created by Evelyn Callista Yaurentius on 22/02/25.
//
import SwiftUI

struct LocationDetailView: View {
    let location: Location
    
    var body: some View {
        VStack {
            let mapURL = getMapURL(latitude: location.latitude, longitude: location.longitude)
            AsyncImage(url: URL(string: mapURL)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            } placeholder: {
                ProgressView()
            }
            .padding()
            
            Text(location.name)
                .font(.title)
                .bold()
                .padding()
            
            Spacer()
        }
        .navigationTitle(location.name)
    }
    
    func getMapURL(latitude: Double, longitude: Double) -> String {
        let apiKey = Bundle.main.mapboxAPIKey
        return "https://api.mapbox.com/styles/v1/mapbox/streets-v12/static/\(longitude),\(latitude),12,0/600x400?access_token=\(apiKey)"
    }
}
