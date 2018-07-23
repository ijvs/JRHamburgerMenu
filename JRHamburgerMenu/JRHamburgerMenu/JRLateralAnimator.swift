//
//  JRLateralAnimator.swift
//  JRHamburgerMenu
//
//  Created by Israel Velazquez on 7/23/18.
//  Copyright © 2018 Israel Jonathan Velazquez Sanchez. All rights reserved.
//

import Foundation
import UIKit

class JRLateralAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    public var isInAnimation: Bool
    
    init(isInAnimation: Bool) {
        self.isInAnimation = isInAnimation
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isInAnimation {
            animateTransitionIn(using: transitionContext)
        }else{
            animateTransitionOut(using: transitionContext)
        }
    }
    
    func animateTransitionIn(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
            return
        }
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toVC.view)
        
        toVC.view.frame.origin.x = -toVC.view.frame.width
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toVC.view.frame.origin.x = 0
        }, completion: { finished in
            transitionContext.completeTransition(true)
        })
    }
    
    func animateTransitionOut(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else {
            return
        }
        fromVC.view.transform
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromVC.view.frame.origin.x = -fromVC.view.frame.width
        }, completion: { finished in
            transitionContext.completeTransition(true)
        })
    }
}
