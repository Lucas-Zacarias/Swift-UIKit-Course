//
//  ViewController.swift
//  09-NavigationModal
//
//  Created by Lucas Zacarias on 23/02/2025.
//

import UIKit

class ViewControllerA: UIViewController {
    private lazy var navigateToViewBBtn: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Go to View B"
        let button = UIButton(type: .system, primaryAction: UIAction(handler: {_ in
            self.navigateToViewB()
        }))
        
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view.addSubview(navigateToViewBBtn)
        
        NSLayoutConstraint.activate([
            navigateToViewBBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigateToViewBBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func navigateToViewB() {
        present(ViewControllerB(), animated: true)
    }


}

