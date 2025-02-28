//
//  ViewController.swift
//  17-Animate
//
//  Created by Lucas Zacarias on 28/02/2025.
//

import UIKit

class ViewController: UIViewController {
    private let mView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
        return view
    }()
    
    private var centerYContraint: NSLayoutConstraint?
    
    @IBOutlet weak var centerYContraintStoryboard: NSLayoutConstraint!
    
    @IBOutlet weak var mViewWithoutAutoLayout: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(mView)
        
//        setupFirstExample()
//        setupSecondExampleAnimateConstraint()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.animateConstraint()
        }
        
        setupAnimationForViewWithoutAutoLayout()
    }
    
    private func setupFirstExample() {
        mView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        mView.center = self.view.center
//        mView.alpha = 0.0
        
        /*UIView.animate(withDuration: 2) {
//            self.mView.frame = CGRect(x: 0, y: 200, width: 100, height: 100)
            self.mView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            self.mView.center = self.view.center
            self.mView.alpha = 1.0
            self.mView.layer.cornerRadius = 50
        }*/
        
        UIView.animate(
            withDuration: 2,
            delay: 2,
            usingSpringWithDamping: 0.1,
            initialSpringVelocity: 1,
            options: .curveEaseInOut) {
                self.mView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
                self.mView.center = self.view.center
                self.mView.layer.cornerRadius = 50
            } completion: { isFinished in
                print("Did it finish? \(isFinished)")
            }
    }
    
    private func setupSecondExampleAnimateConstraint() {
        centerYContraint = mView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        NSLayoutConstraint.activate([
            mView.heightAnchor.constraint(equalToConstant: 200),
            mView.widthAnchor.constraint(equalToConstant: 200),
            centerYContraint!,
            mView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.animateConstraint()
        }
    }

    private func animateConstraint() {
        UIView.animate(withDuration: 2) {
            self.centerYContraintStoryboard?.constant = -200
//            self.centerYContraint?.constant = -200
//            Needed to show correctly the animation
            self.view.layoutIfNeeded()
        }
    }
    
    private func setupAnimationForViewWithoutAutoLayout() {
        UIView.animate(withDuration: 2) {
            self.mViewWithoutAutoLayout.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            self.mViewWithoutAutoLayout.center = self.view.center
            self.mViewWithoutAutoLayout.alpha = 1.0
            self.mViewWithoutAutoLayout.layer.cornerRadius = 50
        }
    }

}

