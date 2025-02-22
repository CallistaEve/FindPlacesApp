//
//  Feature.swift
//  FindPlacesApp
//
//  Created by Evelyn Callista Yaurentius on 22/02/25.
//

struct Feature: Codable {
    let place_name: String
    let center: [Double] // [longitude, latitude]
}
