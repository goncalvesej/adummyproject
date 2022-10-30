//
//  CommentViewModel.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 30/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import Foundation

internal protocol CommentViewModelProtocol {

    var postId: Int { get }
    var comments: [Comment] { get }
    var sections: [BasicTableViewSection] { get }

}

internal struct CommentViewModel: CommentViewModelProtocol {

    internal let postId: Int
    internal let comments: [Comment]
    
    internal init(postId: Int, data: [Comment]) {
        self.comments = data
        self.postId = postId
    }

    internal var sections: [BasicTableViewSection] {

        var sections: [BasicTableViewSection] = []
        var viewModels: [BasicCellViewModel] = []
        for comment in comments {
            viewModels.append(BasicCellViewModel(text: comment.body))
        }
        sections.append(BasicTableViewSection(sectionTitle: "Comments from post: \(postId)", cellsViewModels: viewModels))
        return sections

    }

}
