//
//  UserTableViewSection.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import Foundation

internal final class UserTableViewSection: TableViewSectionProtocol {

    typealias CellViewModel = UserTableViewCellModel

    internal var sectionTitle: String
    internal var cellsViewModels: [UserTableViewCellModel]

    internal init(sectionTitle: String, cellsViewModels: [UserTableViewCellModel]) {
        self.sectionTitle = sectionTitle
        self.cellsViewModels = cellsViewModels
    }

}
