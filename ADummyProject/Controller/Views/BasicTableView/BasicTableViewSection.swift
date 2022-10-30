//
//  BasicTableViewSection.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import Foundation
import Components

internal final class BasicTableViewSection: TableViewSectionProtocol {

    internal typealias CellViewModel = BasicCellViewModel

    internal var sectionTitle: String
    internal var cellsViewModels: [CellViewModel]

    internal init(sectionTitle: String, cellsViewModels: [CellViewModel]) {
        self.sectionTitle = sectionTitle
        self.cellsViewModels = cellsViewModels
    }

}
