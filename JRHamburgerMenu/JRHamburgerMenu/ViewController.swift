//
//  ViewController.swift
//  JRHamburgerMenu
//
//  Created by Israel Velazquez on 7/23/18.
//  Copyright © 2018 Israel Jonathan Velazquez Sanchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didClickButton(_ sender: UIButton) {
        presentMenu()
    }
    
    func presentMenu() {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else {
            fatalError()
        }
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = .custom
        self.present(vc, animated: true)
    }
    let animation = JRLateralAnimator(isInAnimation: true)
}

extension ViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animation.isInAnimation = true
        return animation
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animation.isInAnimation = false
        return animation
    }
}
