//
//  PresentationManager.swift
//  SmallBlog
//
//  Created by czljcb on 16/2/29.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class PresentationManager: NSObject {

    // MARK: - 属性
    var orighFrame: CGRect?

    
    
}



extension PresentationManager: UIViewControllerTransitioningDelegate{
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        
        
        
        let present = CZPresentationController(presentedViewController: presented, presentingViewController: presenting)
        
        guard orighFrame != nil else{
            return present
        }
        
        present.modelFrame = orighFrame!
        
        return present
    }
    
    // MARK: - model 动画
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    // MARK: - dimiss 动画
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
}

extension PresentationManager: UIViewControllerAnimatedTransitioning{
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.25
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        if let modelView = transitionContext.viewForKey(UITransitionContextToViewKey){
            
            transitionContext.containerView()?.addSubview((modelView))
            
            modelView.transform = CGAffineTransformMakeScale(1.0, 0.0)
            modelView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            
            UIView .animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
                
                modelView.transform = CGAffineTransformIdentity
                
                
                }, completion: { (isFinished) -> Void in
                    transitionContext.completeTransition(true)
                    
            })
        }
        else{
            
            let dismissView = transitionContext.viewForKey(UITransitionContextFromViewKey)
            
            transitionContext.containerView()?.addSubview((dismissView)!)
            
            
            UIView .animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
                
                dismissView!.transform = CGAffineTransformMakeScale(1.0, 0.01)
                
                }, completion: { (isFinished) -> Void in
                    transitionContext.completeTransition(true)
                    
            })
            
            
        }
        
        
    }
}