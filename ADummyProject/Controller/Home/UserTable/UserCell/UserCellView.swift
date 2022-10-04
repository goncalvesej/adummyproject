//
//  UserCellView.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 03/10/22.
//

import UIKit

internal class UserCellView: UITableViewCell {
    
    internal var viewModel: UserCellViewModel {
        didSet {
            update()
        }
    }
    
    internal init(_ viewModel: UserCellViewModel) {
        self.viewModel = viewModel
        super.init(style: .default, reuseIdentifier: String(describing: UserCellView.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func update() {
        // update UI...
    }
    
}

extension UserCellView: ViewCode {
    
    internal func buildHierarchy() {
        
    }
    
    internal func setUpConstraints() {
        
    }
    
    internal func render() {
        
    }
    
    internal func setUpAccessibility() {
        
    }
    
}
