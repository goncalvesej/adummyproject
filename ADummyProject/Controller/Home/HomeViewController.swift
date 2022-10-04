//
//  HomeViewController.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 02/10/22.
//

import UIKit

internal class HomeViewController: UIViewController {
    
    internal override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    internal let service: ServiceProtocol
    
    internal init (_ service: ServiceProtocol) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        let v = HomeView()
        view = v
        
        title = "Home Screen"
        
//        navigationItem.largeTitleDisplayMode = .always
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .red
//
//        // setup title font color
        let titleAttribute = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        appearance.titleTextAttributes = titleAttribute
        
//        navigationController?.navigationBar.standardAppearance = appearance
//        navigationController?.navigationBar.scrollEdgeAppearance = appearance
//        navigationController?.navigationBar.barStyle = .default
    }
    
}
