//
//  ViewController.swift
//  07-UIStackView
//
//  Created by Lucas Zacarias on 23/02/2025.
//

import UIKit

class ViewController: UIViewController {
    private let mLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.text = "🍦 Ice Cream Store 🍦 Blu 😸"
        uiLabel.textAlignment = .center
        uiLabel.font = .systemFont(ofSize: 24)
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        return uiLabel
    }()
    private let mStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
//        stackView.alignment = .trailing
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mLabel)
        view.addSubview(mStackView)
        
        NSLayoutConstraint.activate([
            mLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            mLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            mLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            mStackView.topAnchor.constraint(equalTo: mLabel.bottomAnchor, constant: 20),
            mStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            mStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
        
        setDataIntoStackView()
    }

    private func setDataIntoStackView() {
        ["800", "1500", "2500", "4500", "8000"].forEach {iceCreamPrice in
            let button = UIButton()
            
            var configuration = UIButton.Configuration.borderedTinted()
            configuration.title = iceCreamPrice
            configuration.subtitle = "Price"
            configuration.image = UIImage(systemName: "dollarsign")
            configuration.imagePadding = 12
            configuration.baseForegroundColor = .black
            configuration.baseBackgroundColor = .orange
            button.configuration = configuration
            
            mStackView.addArrangedSubview(button)
        }
        
        
    }

}

