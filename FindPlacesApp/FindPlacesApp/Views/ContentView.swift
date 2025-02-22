//
//  ContentView.swift
//  FindPlacesApp
//
//  Created by Evelyn Callista Yaurentius on 22/02/25.
//

import SwiftUI


    struct ContentView: View {
        @StateObject private var viewModel = LocationSearchViewModel()
        @State private var searchText = ""
        
        var body: some View {
            NavigationView {
                VStack {
                    SearchBar(text: $searchText, onSearch: {
                        viewModel.searchLocation(query: searchText)
                    })
                    
                    List(viewModel.searchResults, id: \..name) { result in
                        let location = Location(name: result.name, latitude: result.latitude, longitude: result.longitude)
                        NavigationLink(destination: LocationDetailView(location: location)) {
                            LocationRow(location: location)
                        }
                    }
                }
                .navigationTitle("Find Places")
            }
        }
    }


#Preview {
    ContentView()
}
