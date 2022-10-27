//
//  UserTableViewCellModel.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import Foundation

internal protocol UserTableViewCellModelProtocol {
    
    var user: DummyUser { get }
    
}

internal struct UserTableViewCellModel: UserTableViewCellModelProtocol {
    
    internal var user: DummyUser
    
}
