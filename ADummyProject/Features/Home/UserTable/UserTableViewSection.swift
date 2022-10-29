//
//  UserTableViewSection.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import Foundation
import Components

internal final class UserTableViewSection: TableViewSectionProtocol {

    internal typealias CellViewModel = UserTableViewCellModel

    internal var sectionTitle: String
    internal var cellsViewModels: [CellViewModel]

    internal init(sectionTitle: String, cellsViewModels: [CellViewModel]) {
        self.sectionTitle = sectionTitle
        self.cellsViewModels = cellsViewModels
    }

}
