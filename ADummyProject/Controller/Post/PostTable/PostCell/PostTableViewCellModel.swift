//
//  PostTableViewCellModel.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import Foundation

internal protocol PostTableViewCellModelProtocol {

    var post: Post { get }

}

internal struct PostTableViewCellModel: PostTableViewCellModelProtocol {

    internal var post: Post

}
