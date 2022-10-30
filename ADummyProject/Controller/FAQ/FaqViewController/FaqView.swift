//
//  FaqView.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 28/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import UIKit
import Components

internal final class FaqView: UIView {

    internal var container: UIView
    internal var label: UILabel

    internal var viewModel: FaqViewModelProtocol? {
        didSet {
            update()
        }
    }

    internal override init (frame: CGRect) {
        container = UIView()
        label = UILabel()
        super.init(frame: frame)
        setUpView()
    }

    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func update() {
        if let viewModel {
            label.text = viewModel.text
        }
    }

}

extension FaqView: ViewCoding {

    internal func buildHierarchy() {
        container.addSubview(label)
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

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: container.topAnchor, constant: Theme.shared.spacing.size_md),
            label.leftAnchor.constraint(equalTo: container.leftAnchor, constant: Theme.shared.spacing.size_md),
            label.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -Theme.shared.spacing.size_md)
        ])

    }

    internal func render() {
        container.backgroundColor = Theme.shared.colors.background_base
        label.textColor = Theme.shared.colors.foreground_base
        label.numberOfLines = 0
        label.textAlignment = .justified
    }

    internal func setUpAccessibility() {

    }

}
