//
//  JRBurgerPresentationManager.swift
//  JRHamburgerMenu
//
//  Created by Israel Velazquez on 7/24/18.
//  Copyright © 2018 Israel Jonathan Velazquez Sanchez. All rights reserved.
//

import Foundation
import UIKit

class JRBurgerPresentationManager: NSObject {
    
    private var sourceViewController: UIViewController
    private var presentingController: UIViewController
    public var presetationAnimator: JRLateralAnimator = JRLateralAnimator(isInAnimation: true)
    
    init(sourceViewController: UIViewController, presentingController: UIViewController) {
        self.sourceViewController = sourceViewController
        self.presentingController = presentingController
        super.init()
        
        setup()
    }
    
    private func setup() {
        presentingController.transitioningDelegate = self
        presentingController.modalPresentationStyle = .custom
    }
    
}

extension JRBurgerPresentationManager: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presetationAnimator.isInAnimation = true
        return presetationAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presetationAnimator.isInAnimation = false
        return presetationAnimator
    }
}
