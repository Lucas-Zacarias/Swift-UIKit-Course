//
//  CustomView.swift
//  14-Storyboard
//
//  Created by Lucas Zacarias on 27/02/2025.
//

import UIKit

@IBDesignable
class CustomView: UIView {

    @IBInspectable
    var mBackgroundColor: UIColor = .red {
        didSet {
            backgroundColor = mBackgroundColor
        }
    }

    @IBInspectable
    var mBorderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = mBorderWidth
        }
    }
    
    override func prepareForInterfaceBuilder() {
        backgroundColor = mBackgroundColor
        layer.borderWidth = mBorderWidth
    }
}
