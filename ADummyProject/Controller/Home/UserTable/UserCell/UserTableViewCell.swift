//
//  UserTableViewCell.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import UIKit

internal class UserTableViewCell: UITableViewCell {

    private let container: UIView
    private let nameLabel: UILabel

    internal var viewModel: UserTableViewCellModel? {
        didSet {
            update()
        }
    }

    internal override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        container = UIView()
        nameLabel = UILabel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setUpView()
    }

    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func update() {
        if let viewModel {
            nameLabel.text = viewModel.user.name
        }
    }

}

extension UserTableViewCell: ViewCode {

    internal func buildHierarchy() {
        container.addSubview(nameLabel)
        addSubview(container)
    }

    internal func setUpConstraints() {
        container.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.topAnchor),
            container.rightAnchor.constraint(equalTo: self.rightAnchor),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            container.leftAnchor.constraint(equalTo: self.leftAnchor),

            nameLabel.topAnchor.constraint(equalTo: container.topAnchor),
            nameLabel.rightAnchor.constraint(equalTo: container.rightAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            nameLabel.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 25)
        ])
    }

    internal func render() {
        nameLabel.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .caption1), size: CGFloat(25))
        nameLabel.textColor = .white
        backgroundColor = .black
    }

    internal func setUpAccessibility() {

    }

}
