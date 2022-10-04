//
//  ViewCode.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 02/10/22.
//

import Foundation

internal protocol ViewCode {

    func buildHierarchy()
    func setUpConstraints()
    func render()
    func setUpAccessibility()

}

extension ViewCode {
    
    func setUp() {
        buildHierarchy()
        setUpConstraints()
        render()
        setUpAccessibility()
    }
    
}
