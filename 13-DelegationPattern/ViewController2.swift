//
//  ViewController2.swift
//  13-DelegationPattern
//
//  Created by Lucas Zacarias on 26/02/2025.
//

import UIKit

class ViewController2: UIViewController {
    deinit {
        print("Denit ViewController 2")
    }
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        view.addSubview(mLabel)
        view.addSubview(mButton)
        
//        witout this assignation delegate var will be nil always, apiclient will not know who is their delegate
        apiClient.delegate = self
        
        NSLayoutConstraint.activate([
            mLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            mButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mButton.topAnchor.constraint(equalTo: mLabel.bottomAnchor, constant: 12)
        ])
    }

    private func didTapOnAcceptButton() {
        apiClient.getPokemons()
    }

}

extension ViewController2: ApiClientDelegate {
    func update(pokemons: PokemonResponse) {
        DispatchQueue.main.async {
            self.mLabel.text = pokemons.pokemons.randomElement()?.name
        }
    }
    
}
