//
//  CustomPushAnimation.swift
//  TestTransitions
//
//  Created by Alexey Baryshnikov on 29.11.2020.
//

import UIKit

class CustomPushAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 4.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let src = transitionContext.viewController(forKey: .from),
              let dst = transitionContext.viewController(forKey: .to) else { return }
        let containerView = transitionContext.containerView
        let bounds = UIScreen.main.bounds
        let finalFrame = transitionContext.finalFrame(for: dst)
        
        dst.view.frame = finalFrame.offsetBy(dx: 0, dy: bounds.height)
        src.view.alpha = 1.0
        dst.view.alpha = 0.0
        
        
        containerView.addSubview(dst.view)
        
        UIView.animate(withDuration: 4, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: .curveLinear, animations: {
            
            dst.view.frame = finalFrame
            dst.view.alpha = 1.0
            src.view.alpha = 0.0
            
        }) { (isFinished) in
            src.view.alpha = 1.0
            transitionContext.completeTransition(isFinished)
        }
    }
    

}
