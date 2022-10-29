//
//  FaqView.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 28/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import UIKit

internal final class FaqView: UIView {

    private var viewModel: FaqViewModel?

    internal override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }

    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
