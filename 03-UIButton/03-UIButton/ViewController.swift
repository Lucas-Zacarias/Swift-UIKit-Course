//
//  ViewController.swift
//  03-UIButton
//
//  Created by Lucas Zacarias on 18/02/2025.
//

import UIKit

class ViewController: UIViewController {
    private let button1: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Gatos"
        configuration.subtitle = "Blu"
        configuration.image = UIImage(systemName: "play.circle.fill")
        
        let button = UIButton(type: .system)
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let button2: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Gatos"
        configuration.titleAlignment = .center
        configuration.subtitle = "Blu"
        configuration.image = UIImage(systemName: "play.circle.fill")
        configuration.imagePadding = 12
        configuration.imagePlacement = .trailing
        
        let button = UIButton(type: .system)
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let button3: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Gatos"
        configuration.titleAlignment = .center
        configuration.subtitle = "Blu"
        configuration.image = UIImage(systemName: "play.circle.fill")
        configuration.imagePadding = 12
        configuration.imagePlacement = .top
        configuration.buttonSize = .large
        configuration.baseBackgroundColor = .systemPurple
        configuration.baseForegroundColor = .white
        
        let button = UIButton(type: .system)
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var button4: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Gatos"
        configuration.titleAlignment = .center
        configuration.subtitle = "Blu"
        configuration.image = UIImage(systemName: "play.circle.fill")
        configuration.imagePadding = 12
        configuration.imagePlacement = .top
        configuration.buttonSize = .large
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.showMessage()
        }))
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(button4)
        
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 12),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 12),
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button4.topAnchor.constraint(equalTo: button3.bottomAnchor, constant: 12),
            button4.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func showMessage() {
        print("Button clicked!")
    }
}

