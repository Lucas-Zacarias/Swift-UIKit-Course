//
//  ViewController2.swift
//  15-XIBS
//
//  Created by Lucas Zacarias on 27/02/2025.
//

import UIKit

// View create with its own XIB file, like a storyboard but previous to that
class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func navigateToViewController3(_ sender: Any) {
//        How to navigate from a XIB to another XIB
        let viewController3 = ViewController3(nibName: "ViewController3", bundle: nil)
        
        self.present(viewController3, animated: true)
    }

}
