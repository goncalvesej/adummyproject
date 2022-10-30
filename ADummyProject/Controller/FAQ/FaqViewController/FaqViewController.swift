//
//  FaqViewController.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 28/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import UIKit


import Components
import UIKit

internal class FaqViewController: UIViewController {

    internal let coordinator: FaqCoordinator

    internal init (_ coordinator: FaqCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    internal override func viewDidLoad() {
        super.viewDidLoad()
        let theView = FaqView()
        view = theView
        theView.viewModel = FaqViewModel()
        setupNavigation(title: "FAQ")
    }

    private func setupNavigation(title: String) {
        self.title = title
        if let navigationController {
            navigationController.navigationBar.barStyle = .black
            navigationController.navigationBar.tintColor = Theme.shared.colors.foreground_base

        }
    }

}
