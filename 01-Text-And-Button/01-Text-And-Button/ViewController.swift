//
//  ViewController.swift
//  01-Text-And-Button
//
//  Created by Lucas Zacarias on 05/02/2025.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var actionBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.textColor = .red
        actionBtn.setTitle("(??", for: .normal)
    }

    @IBAction func onButtonClicked(_ sender: Any) {
        print("Click detected")
    }


}

