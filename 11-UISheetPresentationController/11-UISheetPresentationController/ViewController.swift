//
//  ViewController.swift
//  11-UISheetPresentationController
//
//  Created by Lucas Zacarias on 24/02/2025.
//

import UIKit

class ViewController: UIViewController {
    private lazy var mButton: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Tap for a surprise 👀"
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.navigateToSurprise()
        }))
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        view.addSubview(mButton)
        
        NSLayoutConstraint.activate([
            mButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func navigateToSurprise() {
        self.present(SheetViewController(), animated: true)
    }


}

