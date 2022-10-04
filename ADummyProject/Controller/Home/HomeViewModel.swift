//
//  HomeViewModel.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 02/10/22.
//

import Foundation

internal protocol HomeViewModelProtocol {
    
    var users: [User] { get }
    var sections: [UserTableViewSection] { get }
    
}

internal struct HomeViewModel: HomeViewModelProtocol {
    
    internal let users: [User]
    
    internal init(_ users: [User]) {
        self.users = users
    }
    
    internal var sections: [UserTableViewSection] {
        
        var sections: [UserTableViewSection] = []
        var viewModels: [UserCellViewModel] = []
        for user in users {
            viewModels.append(UserCellViewModel(user: user))
        }
        sections.append(UserTableViewSection(sectionTitle: "Users", cellsViewModels: viewModels))
        return sections
        
    }
    
}
