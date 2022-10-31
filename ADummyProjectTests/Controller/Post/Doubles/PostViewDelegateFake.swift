//
//  PostViewDelegateFake.swift
//  ADummyProjectTests
//
//  Created by Eraldo Jr. on 30/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import Foundation

@testable import ADummyProject

internal final class PostViewDelegateFake: PostViewDelegate {
    
    internal var selectedIndexPath: IndexPath?
    
    internal func didSelectRow(_ indexPath: IndexPath) {
        selectedIndexPath = indexPath
    }
    
}
