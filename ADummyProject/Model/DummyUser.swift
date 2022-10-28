//
//  User.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import Foundation
import CoreData

internal struct DummyUser: Codable {

    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String

}

internal struct Address: Codable {

    let street: String
    let suite: String
    let city: String
    let zipcode: String

}

internal struct Geolocation: Codable {

    let lat: String
    let lng: String

}
