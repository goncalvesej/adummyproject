//
//  HomeViewModel.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import Foundation

internal protocol HomeViewModelProtocol {
    
    var users: [DummyUser] { get }
    var sections: [UserTableViewSection] { get }
    
}

internal struct HomeViewModel: HomeViewModelProtocol {
    
    internal let users: [DummyUser]
    
    internal init(_ users: [DummyUser]) {
        self.users = users
    }
    
    internal var sections: [UserTableViewSection] {
        
        var sections: [UserTableViewSection] = []
        var viewModels: [UserTableViewCellModel] = []
        for user in users {
            viewModels.append(UserTableViewCellModel(user: user))
        }
        sections.append(UserTableViewSection(sectionTitle: "Users", cellsViewModels: viewModels))
        return sections
        
    }
    
}
