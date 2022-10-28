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

    private var tableDataSource: UserTableViewDataSource

    internal var viewModel: HomeViewModelProtocol? {
        didSet {
            update()
        }
    }

    internal override init (frame: CGRect) {
        container = UIView()
        tableDataSource = UserTableViewDataSource()
        tableView = UITableView()
        tableView.dataSource = tableDataSource
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: String(describing: UserTableViewCell.self))

        super.init(frame: frame)
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
        container.backgroundColor = .black
        tableView.delegate = self
        tableView.rowHeight = 80
        tableView.backgroundColor = .black
    }

    internal func setUpAccessibility() {

    }

}

extension HomeView: UITableViewDelegate {

    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        theDelegate?.didSelectRow(indexPath)
    }

}
