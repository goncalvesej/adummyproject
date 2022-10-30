//
//  PostViewModel.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import Foundation

internal protocol PostViewModelProtocol {

    var post: [Post] { get }
    var sections: [BasicTableViewSection] { get }

}

internal struct PostViewModel: PostViewModelProtocol {

    internal let post: [Post]

    internal init(_ post: [Post]) {
        self.post = post
    }

    internal var sections: [BasicTableViewSection] {

        var sections: [BasicTableViewSection] = []
        var viewModels: [BasicCellViewModel] = []
        for post in post {
            viewModels.append(BasicCellViewModel(text: post.title))
        }
        sections.append(BasicTableViewSection(sectionTitle: "Posts", cellsViewModels: viewModels))
        return sections

    }

}
