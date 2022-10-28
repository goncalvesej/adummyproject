//
//  FaqViewController.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 28/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import UIKit

internal final class FaqViewController: UIViewController {

    internal init() {
        super.init(nibName: nil, bundle: nil)
    }

    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    internal override func viewDidLoad() {
        let view = FaqView()
        self.view = view
    }

}
