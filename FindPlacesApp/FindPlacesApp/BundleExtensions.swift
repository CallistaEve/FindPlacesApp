//
//  BundleExtensions.swift
//  FindPlacesApp
//
//  Created by Evelyn Callista Yaurentius on 22/02/25.
//

import Foundation

extension Bundle {
    var mapboxAPIKey: String {
        return object(forInfoDictionaryKey: "MAPBOX_API_KEY") as? String ?? ""
    }
}
