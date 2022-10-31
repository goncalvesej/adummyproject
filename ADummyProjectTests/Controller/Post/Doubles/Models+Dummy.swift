//
//  Models+Dummy.swift
//  ADummyProjectTests
//
//  Created by Eraldo Jr. on 30/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import Foundation

@testable import ADummyProject

extension Post {
    
    static let dummy = [
        Post(id: 1, title: "some title 1", body: "some body 1"),
        Post(id: 2, title: "some title 2", body: "some body 2"),
        Post(id: 3, title: "some title 3", body: "some body 3")
    ]
    
}


extension Comment {
    
    static let dummy = [
        Comment(id: 1, postId: 1, name: "comment 1 from post 1", email: "email 1 from post 1", body: "body 1 from post 1"),
        Comment(id: 2, postId: 1, name: "comment 2 from post 1", email: "email 2 from post 1", body: "body 2 from post 1"),
        Comment(id: 3, postId: 1, name: "comment 3 from post 1", email: "email 3 from post 1", body: "body 3 from post 1"),
        
        Comment(id: 4, postId: 2, name: "comment 1 from post 2", email: "email 1 from post 2", body: "body 1 from post 2"),
        Comment(id: 5, postId: 2, name: "comment 2 from post 2", email: "email 2 from post 2", body: "body 2 from post 2"),
        Comment(id: 6, postId: 2, name: "comment 3 from post 2", email: "email 3 from post 2", body: "body 3 from post 2"),
        
        Comment(id: 7, postId: 3, name: "comment 1 from post 3", email: "email 1 from post 3", body: "body 1 from post 3"),
        Comment(id: 8, postId: 3, name: "comment 2 from post 3", email: "email 2 from post 3", body: "body 2 from post 3"),
        Comment(id: 9, postId: 3, name: "comment 3 from post 3", email: "email 3 from post 3", body: "body 3 from post 3"),
    ]
    
}
