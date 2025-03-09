//
//  ViewController.swift
//  19-ChildViewController
//
//  Created by Lucas Zacarias on 09/03/2025.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var createRequestButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("👀 Tap to Load 👀", for: .normal)
        button.addTarget(self, action: #selector(executeHTTP), for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "Child ViewController"
        
        view.addSubview(createRequestButton)
        
        NSLayoutConstraint.activate([
            createRequestButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createRequestButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20)
        ])
    }
    
    @objc func executeHTTP() {
        // add ActivityIndicatorViewController
        let activityIndicatorViewController = ActivityIndicatorViewController()
        view.addSubview(activityIndicatorViewController.view)
        addChild(activityIndicatorViewController)
        activityIndicatorViewController.didMove(toParent: self)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            // delete ActivityIndicatorViewController
            activityIndicatorViewController.willMove(toParent: nil)
            activityIndicatorViewController.removeFromParent()
            activityIndicatorViewController.view.removeFromSuperview()
        }
    }
    
    
}

