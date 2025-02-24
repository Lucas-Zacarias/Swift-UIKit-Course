//
//  SheetViewController.swift
//  11-UISheetPresentationController
//
//  Created by Lucas Zacarias on 24/02/2025.
//

import UIKit

class SheetViewController: UIViewController {
    private let mLabel: UILabel = {
        let label = UILabel()
        label.text = "Pensaste que era otra pantalla, pero ella yo, DIO!"
        label.font = .systemFont(ofSize: 32)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        
        view.addSubview(mLabel)
        
        NSLayoutConstraint.activate([
            mLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            mLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8)
        ])
        
        guard let sheet = presentationController as? UISheetPresentationController else {
            return
        }
        
        sheet.detents = [.medium()] //which height is the max to slide, example: .large()
        sheet.selectedDetentIdentifier = .medium //which height is the max to show, example: .large()
        sheet.prefersGrabberVisible = true
        sheet.preferredCornerRadius = 20
    }
}
