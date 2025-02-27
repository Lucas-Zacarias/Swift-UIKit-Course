//
//  ViewController.swift
//  16-ViewControllerLifecycle
//
//  Created by Lucas Zacarias on 27/02/2025.
//

import UIKit

class ViewController: UIViewController {
    deinit {
//      Here the resources are released
        print("🧹")
    }
    
    private lazy var mButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Hi! Tap to start"
    
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { [weak self] action in
//            self?.presentCurrentView()
            self?.changeButtonContraint()
        }))
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var buttonContraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1, viewDidLoad \(self.description)")
        
        view.addSubview(mButton)
        
        buttonContraint = mButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        NSLayoutConstraint.activate([
            mButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonContraint!
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("2, viewWillAppear \(self.description)")
    }
    
    override func viewWillLayoutSubviews() {
//        Called again when a rotation change happens, also when subviews have to redistrubute into parent view
        super.viewWillLayoutSubviews()
        print("3, viewWillLayoutSubviews \(self.description)")
    }
    
    override func viewDidLayoutSubviews() {
//        Called again when a rotation change happens, also when subviews have to redistrubute into parent view
        super.viewDidLayoutSubviews()
        print("4, viewDidLayoutSubviews \(self.description)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("5, viewDidAppear \(self.description)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("6, viewWillDisappear \(self.description)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("7, viewDidDisappear \(self.description)")
    }
    
    private func presentCurrentView() {
        self.present(ViewController(), animated: true)
    }

    private func changeButtonContraint() {
        view.removeConstraint(buttonContraint!)
        
        buttonContraint = mButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20)
        
        NSLayoutConstraint.activate([
            mButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonContraint!
        ])
    }

}

