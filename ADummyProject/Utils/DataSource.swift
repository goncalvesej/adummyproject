//
//  DataSource.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 03/10/22.
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].cellsViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UserCellView.self), for: indexPath) as? UserCellView else {
            return UITableViewCell()
        }
        
        cell.viewModel = sections[indexPath.section].cellsViewModels[indexPath.row]
        return cell
    }
    
}
