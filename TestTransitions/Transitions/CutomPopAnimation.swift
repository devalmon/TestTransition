//
//  CutomPopAnimation.swift
//  TestTransitions
//
//  Created by Alexey Baryshnikov on 04.12.2020.
//

import UIKit

private let duration: TimeInterval = 1.0

class CutomPopAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
              let toVC = transitionContext.viewController(forKey: .to) else { return }
        
        let containerView = transitionContext.containerView
        let bounds = UIScreen.main.bounds
        let finalFrame = transitionContext.finalFrame(for: toVC)
        containerView.addSubview(toVC.view)
        
        fromVC.view.alpha = 0.0
        toVC.view.frame = finalFrame.offsetBy(dx: bounds.width, dy: 0)
        toVC.view.alpha = 0.0
        fromVC.view.alpha = 1.0
        fromVC.view.frame = bounds
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
            toVC.view.frame = finalFrame
            toVC.view.alpha = 1.0
            fromVC.view.alpha = 0.0
        } completion: { (isFinished) in
            fromVC.view.alpha = 1.0
            transitionContext.completeTransition(isFinished)
        }

    }
    
    
}
