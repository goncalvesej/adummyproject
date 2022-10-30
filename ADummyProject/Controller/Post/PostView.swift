//
//  PostView.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import UIKit
import Components

internal protocol PostViewDelegate: AnyObject {

    func didSelectRow(_ indexPath: IndexPath)

}

internal final class PostView: UIView {

    internal var container: UIView
    internal var tableView: UITableView
    internal weak var theDelegate: PostViewDelegate?

    private var tableDataSource: BasicTableViewDataSourceProtocol

    internal var viewModel: PostViewModelProtocol? {
        didSet {
            update()
        }
    }

    internal override init (frame: CGRect) {
        container = UIView()
        tableDataSource = BasicTableViewDataSource()
        tableView = UITableView()
        tableView.dataSource = tableDataSource
        tableView.register(BasicCellView.self, forCellReuseIdentifier: String(describing: BasicCellView.self))

        super.init(frame: frame)
//        tableDataSource.didSelectRow = selectedRow
        setUpView()
    }

    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func update() {
        if let viewModel {
            tableDataSource.sections = viewModel.sections
            tableView.reloadData()
        }
    }

}

extension PostView: ViewCoding {

    internal func buildHierarchy() {
        container.addSubview(tableView)
        addSubview(container)
    }

    internal func setUpConstraints() {

        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            container.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            container.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: container.topAnchor),
            tableView.leftAnchor.constraint(equalTo: container.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: container.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])

    }

    internal func render() {
        container.backgroundColor = Theme.shared.colors.background_base
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = Theme.shared.colors.background_base
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.separatorColor = Theme.shared.colors.feedback_success_light
    }

    internal func setUpAccessibility() {

    }

    private func selectedRow(indexPath: IndexPath) {
        theDelegate?.didSelectRow(indexPath)
    }

}

extension PostView: UITableViewDelegate {
    
    internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Theme.shared.spacing.size_xl
    }

    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow(indexPath: indexPath)
    }
    
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableDataSource.sectionHeaderFactory(tableView: tableView, section: section, headerHeight: Theme.shared.spacing.size_xl)
    }

}
