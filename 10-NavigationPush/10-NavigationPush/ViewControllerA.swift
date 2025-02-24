//
//  ViewController.swift
//  10-NavigationPush
//
//  Created by Lucas Zacarias on 24/02/2025.
//

import UIKit

class ViewControllerA: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        title = "View A"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Next",
            style: .done,
            target: self,
            action: #selector(nextView)
        )
    }
    
    @objc
    private func nextView() {
        self.navigationController?.pushViewController(ViewControllerB(), animated: true)
    }
    
    
}

