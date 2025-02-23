//
//  ViewControllerC.swift
//  09-NavigationModal
//
//  Created by Lucas Zacarias on 23/02/2025.
//

import Foundation
import UIKit

class ViewControllerC: UIViewController {
    private lazy var dismissBtn: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Dismiss View C"
        let button = UIButton(type: .system, primaryAction: UIAction(handler: {_ in
            self.dismiss()
        }))
        
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        view.addSubview(dismissBtn)
        
        NSLayoutConstraint.activate([
            dismissBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func dismiss() {
     dismiss(animated: true)
    }
}
