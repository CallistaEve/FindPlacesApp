//
//  SearchBar.swift
//  FindPlacesApp
//
//  Created by Evelyn Callista Yaurentius on 22/02/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var onSearch: () -> Void
    
    var body: some View {
        HStack {
            TextField("Search for a place...", text: $text, onCommit: onSearch)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}
