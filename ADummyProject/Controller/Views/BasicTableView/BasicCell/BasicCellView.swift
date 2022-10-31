//
//  BasicCellView.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 30/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import UIKit
import Components

internal class BasicCellView: UITableViewCell {

    internal let container: UIView
    internal let nameLabel: UILabel

    internal var viewModel: BasicCellViewModel? {
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
            nameLabel.text = viewModel.text
        }
    }

}

extension BasicCellView: ViewCoding {

    internal func buildHierarchy() {
        container.addSubview(nameLabel)
        addSubview(container)
    }

    internal func setUpConstraints() {
        container.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.topAnchor, constant: Theme.shared.spacing.size_sm),
            container.rightAnchor.constraint(equalTo: self.rightAnchor),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Theme.shared.spacing.size_sm),
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
