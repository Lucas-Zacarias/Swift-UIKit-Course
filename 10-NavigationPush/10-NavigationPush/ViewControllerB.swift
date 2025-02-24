//
//  ViewControllerB.swift
//  10-NavigationPush
//
//  Created by Lucas Zacarias on 24/02/2025.
//

import UIKit

class ViewControllerB: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        title = "View B"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Next",
            style: .done,
            target: self,
            action: #selector(nextView)
        )
    }
    
    @objc
    private func nextView() {
        self.navigationController?.pushViewController(ViewControllerC(), animated: true)
    }
    
    
}
