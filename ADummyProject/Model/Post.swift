//
//  Post.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import Foundation
import CoreData

internal struct Post: Codable {

    internal let id: Int
    internal let title: String
    internal let body: String

}

internal struct Comment: Codable {

    internal let id: Int
    internal let postId: Int
    internal let name: String
    internal let email: String
    internal let body: String

}
