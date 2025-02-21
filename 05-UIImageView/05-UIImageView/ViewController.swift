//
//  ViewController.swift
//  05-UIImageView
//
//  Created by Lucas Zacarias on 21/02/2025.
//

import UIKit

class ViewController: UIViewController {
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "cat.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .orange
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = 100
        imageView.layer.borderWidth = 10
        imageView.layer.borderColor = UIColor.blue.cgColor
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 200),
            image.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
}

