//
//  ViewController.swift
//  13-DelegationPattern
//
//  Created by Lucas Zacarias on 26/02/2025.
//

import UIKit

class ViewController: UIViewController {
    private let apiClient = ApiClient()
    private let mLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "placeholder"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var mButton: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Tap to Start!"
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { [weak self] _ in
            self?.didTapOnAcceptButton()
        }))
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var mButton2: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Tap to Start 2!"
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { [weak self] _ in
            self?.didTapOnAcceptButton2()
        }))
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mLabel)
        view.addSubview(mButton)
        view.addSubview(mButton2)
        
        apiClient.delegate = self
        
        NSLayoutConstraint.activate([
            mLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            mButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mButton.topAnchor.constraint(equalTo: mLabel.bottomAnchor, constant: 12),
            
            mButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mButton2.topAnchor.constraint(equalTo: mButton.bottomAnchor, constant: 12)
        ])
    }

    private func didTapOnAcceptButton() {
        apiClient.getPokemons()
    }
    
    private func didTapOnAcceptButton2() {
        present(ViewController2(), animated: true)
    }

}

extension ViewController: ApiClientDelegate {
    func update(pokemons: PokemonResponse) {
        DispatchQueue.main.async {
            self.mLabel.text = pokemons.pokemons.randomElement()?.name
        }
    }
    
}

