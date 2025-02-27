//
//  CustomView.swift
//  15-XIBS
//
//  Created by Lucas Zacarias on 27/02/2025.
//

import UIKit

// Custom view used to inject into a ViewController that has its own XIB file
class CustomView: UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let nib = UINib(nibName: "CustomView", bundle: nil)
        
        guard let customView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Error instantiating CustomView")
        }
        
        addSubview(customView)
    }

}
