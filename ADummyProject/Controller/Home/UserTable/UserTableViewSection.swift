//
//  UserTableViewSection.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 03/10/22.
//

import Foundation

internal final class UserTableViewSection: TableViewSectionProtocol {
    
    typealias CellViewModel = UserCellViewModel
    
    internal var sectionTitle: String
    internal var cellsViewModels: [UserCellViewModel]
    
    internal init(sectionTitle: String, cellsViewModels: [UserCellViewModel]) {
        self.sectionTitle = sectionTitle
        self.cellsViewModels = cellsViewModels
    }
    
}
