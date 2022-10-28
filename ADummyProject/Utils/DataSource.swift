//
//  DataSource.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import UIKit

internal protocol TableViewSectionProtocol {

    associatedtype CellViewModel

    var sectionTitle: String { get }
    var cellsViewModels: [CellViewModel] { get }

}

internal class DataSource: NSObject, UITableViewDataSource {

    internal var sections: [UserTableViewSection]

    internal override init() {
        sections = []
        super.init()
    }

    internal func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count > 0 ? sections[section].cellsViewModels.count : 0
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UserTableViewCell.self),
                                                       for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        let viewModel = sections[indexPath.section].cellsViewModels[indexPath.row]
        cell.viewModel = viewModel
        return cell
    }

}
