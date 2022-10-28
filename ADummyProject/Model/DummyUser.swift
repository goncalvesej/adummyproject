//
//  User.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import Foundation
import CoreData

internal struct DummyUser: Codable {

    internal let id: Int
    internal let name: String
    internal let username: String
    internal let email: String
    internal let phone: String
    internal let website: String

}

internal struct Address: Codable {

    internal let street: String
    internal let suite: String
    internal let city: String
    internal let zipcode: String

}
