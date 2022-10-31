//
//  CommentViewController.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 30/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import Components
import Coordinator
import UIKit

internal class CommentViewController: UIViewController {

    private var data: [Comment]?

    internal let service: ServiceProtocol
    internal let coordinator: CoordinatorProtocol
    internal let postId: Int

    internal init (postId: Int, _ service: ServiceProtocol, _ coordinator: CoordinatorProtocol) {
        self.service = service
        self.coordinator = coordinator
        self.postId = postId
        super.init(nibName: nil, bundle: nil)
    }

    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    internal override func viewDidLoad() {
        super.viewDidLoad()
        let theView = CommentView()
        view = theView

        setupNavigation(title: "Comments")
        fetchData()
    }

    private func fetchData() {
        service.fetchCommentsByPost(postId: postId) { [weak self] result in
            switch result {
            case .success(let data):
                self?.data = data
                if let theView = self?.view as? CommentView, let ctrlr = self {
                    theView.viewModel = CommentViewModel(postId: ctrlr.postId, data: data)
                }
            case .failure:
                let alert = UIAlertController(title: "Ouch!", message: "Something went wrong", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Understood", style: .default, handler: { _ in }))
                self?.present(alert, animated: true, completion: nil)
            }

        }
    }

    private func setupNavigation(title: String) {
        self.title = title
        if let navigationController {
            navigationController.navigationBar.barStyle = .black
            navigationController.navigationBar.tintColor = Theme.shared.colors.foreground_base
        }
    }

}
