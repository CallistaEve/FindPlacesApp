//
//  LocationRow.swift
//  FindPlacesApp
//
//  Created by Evelyn Callista Yaurentius on 22/02/25.
//
import SwiftUI

struct LocationRow: View {
    let location: Location
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.headline)
            Text("Lat: \(location.latitude), Lon: \(location.longitude)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(5)
    }
}
