//
//  ViewController.swift
//  04-UILabel
//
//  Created by Lucas Zacarias on 18/02/2025.
//

import UIKit

class ViewController: UIViewController {
    private let uiLabel1: UILabel = {
        let label = UILabel()
        label.text = "Egoistas"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 24)
        label.textAlignment = .center
        label.textColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let uiLabel2: UILabel = {
        let label = UILabel()
        label.text = "Team Z: Isagi Yoichi, Meguru Bachira, Hyoma Chigiri, Rensuke Kunigami, Kuon, Gin Gagamaru, Raichi, Naruhaya, Igarashi"
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .blue
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    private let uiLabel3: UILabel = {
        let text = "Blue Lock XI: Isagi Yoichi, Meguru Bachira, Hyoma Chigiri, Gin Gagamaru, Raichi, Nagi, Reo, Rin, Barou, Otoya, Karasu, Hiori, Niko, Aryu, Yukimiya, Kiyora"
        let attributedText: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .underlineColor: UIColor.yellow,
            .foregroundColor: UIColor.blue,
            .backgroundColor: UIColor.gray,
            .font: UIFont.systemFont(ofSize: 16)
        ]
        
        let attributedString = NSAttributedString(string: text, attributes: attributedText)
    
        let label = UILabel()
        label.attributedText = attributedString
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(uiLabel1)
        view.addSubview(uiLabel2)
        view.addSubview(uiLabel3)
        
        NSLayoutConstraint.activate([
            uiLabel1.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            uiLabel1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            uiLabel2.topAnchor.constraint(equalTo: uiLabel1.bottomAnchor, constant: 8),
            uiLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            uiLabel2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            uiLabel3.topAnchor.constraint(equalTo: uiLabel2.bottomAnchor, constant: 8),
            uiLabel3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiLabel3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            uiLabel3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
    }


}

