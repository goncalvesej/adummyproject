//
//  FaqViewModel.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 28/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import Foundation

internal protocol FaqViewModelProtocol {

    var text: String { get }

}

internal struct FaqViewModel: FaqViewModelProtocol {

    internal var text: String

    internal init(text: String) {
        self.text = text
    }

}
