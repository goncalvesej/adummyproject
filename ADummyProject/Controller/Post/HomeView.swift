//
//  HomeView.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import UIKit
import Components

internal protocol HomeViewDelegate: AnyObject {

    func didSelectRow(_ indexPath: IndexPath)

}

internal final class HomeView: UIView {

    internal var container: UIView
    internal var tableView: UITableView
    internal weak var theDelegate: HomeViewDelegate?

    private var tableDataSource: PostTableViewDataSource

    internal var viewModel: HomeViewModelProtocol? {
        didSet {
            update()
        }
    }

    internal override init (frame: CGRect) {
        container = UIView()
        tableDataSource = PostTableViewDataSource()
        tableView = UITableView()
        tableView.dataSource = tableDataSource
        tableView.delegate = tableDataSource
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))

        super.init(frame: frame)
        tableDataSource.didSelectRow = selectedRow
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

extension HomeView: ViewCoding {

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
        tableView.rowHeight = 80
        tableView.backgroundColor = Theme.shared.colors.background_base
    }

    internal func setUpAccessibility() {

    }

    private func selectedRow(indexPath: IndexPath) {
        theDelegate?.didSelectRow(indexPath)
    }

}
