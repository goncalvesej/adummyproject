//
//  HomeView.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 02/10/22.
//

import UIKit

internal final class HomeView: UIView {
    
    internal var container: UIView
    internal var tableView: UITableView
    
    private var dataSource: DataSource
    
    internal var viewModel: HomeViewModelProtocol? {
        didSet {
            update()
        }
    }
    
    internal override init (frame: CGRect) {
        container = UIView()
        dataSource = DataSource()
        tableView = UITableView()
        super.init(frame: frame)
        setUp()
    }
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func update() {
        if let viewModel {
            dataSource.sections = viewModel.sections
        }
    }
    
}

extension HomeView: ViewCode {
    
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
            container.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
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
        backgroundColor = .black
        tableView.backgroundColor = .red
    }
    
    internal func setUpAccessibility() {
        
    }
    
}
