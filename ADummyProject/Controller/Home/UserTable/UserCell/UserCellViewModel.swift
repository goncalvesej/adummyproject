//
//  UserCellViewModel.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 03/10/22.
//

import Foundation

internal protocol UserCellViewModelProtocol {
    
    var user: User { get }
    
}

internal struct UserCellViewModel: UserCellViewModelProtocol {
    
    internal var user: User
    
}
