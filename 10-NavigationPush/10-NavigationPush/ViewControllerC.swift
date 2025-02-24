//
//  ViewControllerC.swift
//  10-NavigationPush
//
//  Created by Lucas Zacarias on 24/02/2025.
//

import UIKit

class ViewControllerC: UIViewController {
    private lazy var navigateToD: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Pop to View A"
        let uiButton = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.navigateToViewD()
        }))
        
        uiButton.configuration = configuration
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        
        return uiButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        title = "View C"
        
        view.addSubview(navigateToD)
        
        NSLayoutConstraint.activate([
            navigateToD.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigateToD.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func navigateToViewD() {
//        Navigate to previous view
//        self.navigationController?.popViewController(animated: true)
        
//        Navigate to root view
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
