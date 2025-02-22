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
                    NavigationLink(destination: LocationDetailView(location: result)) {
                        LocationRow(location: result)
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
