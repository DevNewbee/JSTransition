//
//  JSDimissTransition.swift
//  JSTransition
//
//  Created by 王俊硕 on 2017/11/13.
//  Copyright © 2017年 王俊硕. All rights reserved.
//

import UIKit

class JSDismissTransition: NSObject ,UIViewControllerAnimatedTransitioning {
    var fisrtStepHeight: CGFloat = 0
    var duration = 0.5
    
    let imageSets = ["duck", "squirrel", "fish", "unknown", "rabbit"]
    let titleSets = ["duck", "squirrel", "fish", "unknown", "rabbit"]
    let descriptionSets = ["a duck", "a squirrel", "a fish", "unknown monster", "a rabbit"]
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration // 动画时长
    }
    func animationEnded(_ transitionCompleted: Bool) {
        print("Done")
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to), let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
        
        let fromView = fromViewController.view!
        let toView = toViewController.view!
        
        let container = transitionContext.containerView
        
        let screenWidth = UIScreen.main.bounds.width
        let screentHeight = UIScreen.main.bounds.height
        
        
        container.bringSubview(toFront: fromView)
        // back
        let controller = toViewController as! MainTableViewController
        let rowHeight = CGFloat(495)
        
        let offset = (fromViewController as! DestinationViewController).fromViewOffset!
        let ratio = rowHeight/screentHeight
        
        let duration = transitionDuration(using: transitionContext)
        transitionContext.containerView.bringSubview(toFront: fromView)
        
        let firstStepDuration = duration * 0.2
        let secondStepDuration = duration - firstStepDuration
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: firstStepDuration) {
                fromView.frame = CGRect(origin: CGPoint(x: 0,y: offset), size: UIScreen.main.bounds.size)
                fromView.transform = CGAffineTransform(scaleX: 1, y: ratio)
            }
            UIView.addKeyframe(withRelativeStartTime: firstStepDuration, relativeDuration: secondStepDuration) {
                fromView.alpha = 0
            }
        }) { _ in
            transitionContext.completeTransition(true)
        }
        
        
    }
    
}
