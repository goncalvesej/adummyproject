//
//  PostTableViewSection.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import Foundation
import Components

internal final class PostTableViewSection: TableViewSectionProtocol {

    internal typealias CellViewModel = PostTableViewCellModel

    internal var sectionTitle: String
    internal var cellsViewModels: [CellViewModel]

    internal init(sectionTitle: String, cellsViewModels: [CellViewModel]) {
        self.sectionTitle = sectionTitle
        self.cellsViewModels = cellsViewModels
    }

}
