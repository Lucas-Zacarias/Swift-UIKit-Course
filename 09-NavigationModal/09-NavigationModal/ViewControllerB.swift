//
//  ViewControllerB.swift
//  09-NavigationModal
//
//  Created by Lucas Zacarias on 23/02/2025.
//

import Foundation
import UIKit

class ViewControllerB: UIViewController {
    private lazy var dismissBtn: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Dismiss View B"
        let button = UIButton(type: .system, primaryAction: UIAction(handler: {_ in
            self.dismiss()
        }))
        
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var navigateToViewCBtn: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Go to View C"
        let button = UIButton(type: .system, primaryAction: UIAction(handler: {_ in
            self.navigateToViewC()
        }))
        
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(dismissBtn)
        view.addSubview(navigateToViewCBtn)
        
        NSLayoutConstraint.activate([
            dismissBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            navigateToViewCBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigateToViewCBtn.topAnchor.constraint(equalTo: dismissBtn.bottomAnchor, constant: 12)
        ])
    }
    
    private func dismiss() {
     dismiss(animated: true)
    }
    
    private func navigateToViewC() {
        present(ViewControllerC(), animated: true)
    }
}
