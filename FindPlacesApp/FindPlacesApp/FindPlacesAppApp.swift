//
//  FindPlacesAppApp.swift
//  FindPlacesApp
//
//  Created by Evelyn Callista Yaurentius on 22/02/25.
//

import SwiftUI

@main
struct FindPlacesAppApp: App {
    init() {
        print("Mapbox API Key: \(Bundle.main.mapboxAPIKey)")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

