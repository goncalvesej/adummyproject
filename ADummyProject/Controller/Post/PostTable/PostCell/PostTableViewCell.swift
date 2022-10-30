//
//  PostTableViewCell.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import UIKit
import Components

internal class PostTableViewCell: UITableViewCell {

    private let container: UIView
    private let nameLabel: UILabel

    internal var viewModel: PostTableViewCellModel? {
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
            nameLabel.text = viewModel.post.title
        }
    }

}

extension PostTableViewCell: ViewCoding {

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
            nameLabel.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -Theme.shared.spacing.size_md),
            nameLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            nameLabel.leftAnchor.constraint(equalTo: container.leftAnchor, constant: Theme.shared.spacing.size_md)
        ])
    }

    internal func render() {
        nameLabel.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .caption1), size: Theme.shared.spacing.size_md)
        nameLabel.textColor = Theme.shared.colors.foreground_base
        nameLabel.numberOfLines = 0
        backgroundColor = Theme.shared.colors.background_base
    }

    internal func setUpAccessibility() {

    }

}
