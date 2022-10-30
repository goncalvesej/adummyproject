//
//  BasicCellViewModel.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 30/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import Foundation

internal protocol BasicCellViewModelProtocol {

    var text: String { get }

}

internal struct BasicCellViewModel: BasicCellViewModelProtocol {

    internal var text: String

}
