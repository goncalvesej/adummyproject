//
//  ViewCode.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import UIKit

internal protocol ViewCode {

    func buildHierarchy()
    func setUpConstraints()
    func render()
    func setUpAccessibility()

}

extension ViewCode {

    func setUpView() {
        buildHierarchy()
        setUpConstraints()
        render()
        setUpAccessibility()
    }
    
}
