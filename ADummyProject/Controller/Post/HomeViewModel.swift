//
//  HomeViewModel.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import Foundation

internal protocol HomeViewModelProtocol {

    var post: [Post] { get }
    var sections: [PostTableViewSection] { get }

}

internal struct HomeViewModel: HomeViewModelProtocol {

    internal let post: [Post]

    internal init(_ post: [Post]) {
        self.post = post
    }

    internal var sections: [PostTableViewSection] {

        var sections: [PostTableViewSection] = []
        var viewModels: [PostTableViewCellModel] = []
        for post in post {
            viewModels.append(PostTableViewCellModel(post: post))
        }
        sections.append(PostTableViewSection(sectionTitle: "Posts", cellsViewModels: viewModels))
        return sections

    }

}
