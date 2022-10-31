// swiftlint:disable line_length
//
//  FaqViewController.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 28/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import Components
import Coordinator
import UIKit

internal class FaqViewController: UIViewController {

    internal let coordinator: CoordinatorProtocol

    internal init (_ coordinator: CoordinatorProtocol) {
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
        theView.viewModel = FaqViewModel(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
        setupNavigation(title: "FAQ")
    }

    private func setupNavigation(title: String) {
        self.title = title
        if let navigationController {
            navigationController.navigationBar.barStyle = .black
            navigationController.navigationBar.tintColor = Theme.shared.colors.foreground_base
            let backButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(popNavigation))
            navigationItem.leftBarButtonItem = backButton
        }
    }
    
    @objc private func popNavigation() {
        coordinator.handle(FaqCoordinatorEvent.pop)
    }

}
