//
//  User.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 02/10/22.
//

import Foundation

internal struct User: Codable {
    
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
    
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

internal struct Company: Codable {
    
    let name: String
    let catchPhrase: String
    let bs: String
    
}
