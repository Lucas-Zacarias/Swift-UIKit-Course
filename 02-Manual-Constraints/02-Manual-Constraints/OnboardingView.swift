//
//  OnboardingView.swift
//  02-Manual-Constraints
//
//  Created by Lucas Zacarias on 05/02/2025.
//

import Foundation
import UIKit

final class OnboardingView: UIView {
    private let onboardingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logo for uikitapp")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Welcome to kimi no koto app"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var skipOnboardingButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Tap to start"
        config.subtitle = "100 Kanojo"
        
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(showMessage), for: .touchUpInside)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addViews()
        configureConstraints()
    }
    
    private func addViews() {
        backgroundColor = .white
        addSubview(onboardingImageView)
        addSubview(label)
        addSubview(skipOnboardingButton)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            onboardingImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            onboardingImageView.topAnchor.constraint(equalTo: topAnchor),
            onboardingImageView.widthAnchor.constraint(equalTo: widthAnchor),
            
            label.bottomAnchor.constraint(equalTo: skipOnboardingButton.topAnchor, constant: -32),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            skipOnboardingButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            skipOnboardingButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    @objc func showMessage() {
        print("Arigatoo")
    }
}
