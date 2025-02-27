//
//  ViewController.swift
//  15-XIBS
//
//  Created by Lucas Zacarias on 27/02/2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapOnButton() {
//        How to navigate from a storyboard to a XIB
        let vC2 = ViewController2(nibName: "ViewController2", bundle: nil)
        self.present(vC2, animated: true)
    }
}

