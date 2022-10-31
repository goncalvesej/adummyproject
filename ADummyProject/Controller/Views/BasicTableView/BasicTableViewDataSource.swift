//
//  BasicTableViewDataSource.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 28/10/22.
//

import UIKit
import Components

internal typealias BasicTableViewDataSourceProtocol = NSObject & BasicTableViewRenderProtocol & UITableViewDataSource

internal protocol BasicTableViewRenderProtocol {

    var sections: [BasicTableViewSection] { get set }
    func sectionHeaderFactory(tableView: UITableView, section: Int, headerHeight: CGFloat) -> UIView

}

internal class BasicTableViewDataSource: BasicTableViewDataSourceProtocol {

    internal var sections: [BasicTableViewSection]

    internal override init() {
        self.sections = []
        super.init()
    }

    internal func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count > 0 ? sections[section].cellsViewModels.count : 0
    }

    internal func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section < sections.count ? sections[section].sectionTitle : String()
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BasicCellView.self),
                                                       for: indexPath) as? BasicCellView else {
            return UITableViewCell()
        }
        let viewModel = sections[indexPath.section].cellsViewModels[indexPath.row]
        cell.viewModel = viewModel
        return cell
    }

    internal func sectionHeaderFactory(tableView: UITableView, section: Int, headerHeight: CGFloat) -> UIView {
        let padding = Theme.shared.spacing.size_md
        let headerView = UILabel(frame: CGRect(x: padding,
                                          y: 0,
                                          width: tableView.frame.width - (padding * 2),
                                          height: headerHeight))

        headerView.backgroundColor = Theme.shared.colors.background_base
        let title = section < sections.count ? sections[section].sectionTitle : String()
        let label = UILabel(frame: headerView.frame)
        label.text = title
        label.font = .systemFont(ofSize: Theme.shared.spacing.size_lg)
        label.textColor = Theme.shared.colors.feedback_success_light

        headerView.addSubview(label)
        return headerView
    }

}
