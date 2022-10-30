//
//  HomeViewController.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import Components
import UIKit

internal class HomeViewController: UIViewController {

    private var data: [Post]?

    internal let service: ServiceProtocol
    internal let coordinator: AppCoordinator

    internal init (_ service: ServiceProtocol, _ coordinator: AppCoordinator) {
        self.service = service
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    internal override func viewDidLoad() {
        super.viewDidLoad()
        let theView = HomeView()
        theView.theDelegate = self
        view = theView

        setupNavigation(title: "Posts")
        fetchData()
    }

    private func fetchData() {
        service.fetchPosts(completion: { [weak self] result in
            switch result {
            case .success(let data):
                self?.data = data
                if let theView = self?.view as? HomeView {
                    theView.viewModel = HomeViewModel(data)
                }
            case .failure:
                let alert = UIAlertController(title: "Ouch!", message: "Something went wrong", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Understood", style: .default, handler: { _ in

                }))
                self?.present(alert, animated: true, completion: nil)
            }

        })
    }

    private func setupNavigation(title: String) {
        self.title = title
        if let navigationController {
            navigationController.navigationBar.barStyle = .black
            navigationController.navigationBar.tintColor = Theme.shared.colors.foreground_base

            let buttonImage = UIImage(systemName: "questionmark.circle.fill")
            let faqButton = UIBarButtonItem(image: buttonImage, style: .plain, target: self, action: #selector(openFaq))
            faqButton.tintColor = Theme.shared.colors.foreground_base
            navigationItem.rightBarButtonItem = faqButton
            let btn = UIButton()
            btn.addTarget(self, action: #selector(openFaq), for: .touchUpInside)

        }
    }

    @objc private func openFaq() {
//        let alert = UIAlertController(title: "Faq open", message: nil, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Close", style: .cancel){ _ in })
//        self.present(alert, animated: true)
        coordinator.handle(AppCoordinatorEvent.faq)
    }

    private func openComments(postId: Int) {
//        let alert = UIAlertController(title: "Faq open", message: nil, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Close", style: .cancel){ _ in })
//        self.present(alert, animated: true)
        coordinator.handle(AppCoordinatorEvent.commentsByPost(postId))
    }

}

extension HomeViewController: HomeViewDelegate {

    internal func didSelectRow(_ index: IndexPath) {
        coordinator.handle(AppCoordinatorEvent.home)
    }

}
