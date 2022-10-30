//
//  PostTableViewDataSource.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 28/10/22.
//

import UIKit
import Components

internal class PostTableViewDataSource: NSObject, UITableViewDataSource {

    internal var sections: [PostTableViewSection]

    internal let headerHeight: CGFloat
    internal var didSelectRow: ((_ index: IndexPath) -> Void)?

    internal init(headerHeight: CGFloat = Theme.shared.spacing.size_xl) {
        self.sections = []
        self.headerHeight = headerHeight
        super.init()
    }

    internal func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.headerHeight
    }

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count > 0 ? sections[section].cellsViewModels.count : 0
    }

    internal func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section < sections.count ? sections[section].sectionTitle : String()
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self),
                                                       for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        let viewModel = sections[indexPath.section].cellsViewModels[indexPath.row]
        cell.viewModel = viewModel
        return cell
    }

}

extension PostTableViewDataSource: UITableViewDelegate {

    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRow?(indexPath)
    }

    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
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
