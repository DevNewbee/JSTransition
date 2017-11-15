//
//  Transition.swift
//  CustomTransitionDemo
//
//  Created by 王俊硕 on 2017/10/11.
//  Copyright © 2017年 王俊硕. All rights reserved.
//

import UIKit

class JSTransition: NSObject ,UIViewControllerAnimatedTransitioning {
    var fisrtStepHeight: CGFloat = 0
    var duration = 0.9
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration // 动画时长
    }
   
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to), let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
        
        let fromView = fromViewController.view!
        let toView = toViewController.view!

        let container = transitionContext.containerView
        
        let originalFrame = toView.frame
        let screenWidth = UIScreen.main.bounds.width
        let screentHeight = UIScreen.main.bounds.height
        
        
        container.addSubview(toView)
        
        
        let fromController = fromViewController as! MainTableViewController
        let toController = toViewController as! DestinationViewController
        
        let selectedIndex = fromController.selectedIndexPath!
        toController.setup(withData: fromController.selectedData)
        
        let navigationBarOffset = CGFloat(0) // Add the navigation bar height
        // calulte the position
        let originalY = fromController.selectedOrigin.y + navigationBarOffset // 选中的cell original y 滚动距离
        let rowHeight = fromController.rowHeight
        let scrollOffsetY = fromController.contentView.contentOffset.y // 初始-20 因为statusBar
        print("oY: \(originalY), sOY: \(scrollOffsetY)")
//        let offset = originalY-screentHeight/2+rowHeight/2-scrollOffsetY //
        let offset = originalY - scrollOffsetY // status bar height included
        let ratio = rowHeight/screentHeight
        
        // add a animation mask view   the same frame as the cell
        let animationView = fromController.cellSnap //
        print(animationView.frame)
        print("frmae`")
        animationView.frame.origin = CGPoint(x: 0, y: offset) // status bar height + 20
        container.addSubview(animationView)
        
        toView.frame.origin = CGPoint(x: 0, y: offset)
        toController.fromViewOffset = offset // For dimiss
        let duration = transitionDuration(using: transitionContext)
        toView.transform = CGAffineTransform(scaleX: 1, y: ratio) // 围绕中心缩放
        toView.center = animationView.center
        
        let stepOneDuration = duration * 0.4
        let stepTwoDuration = duration - stepOneDuration
        
        print(animationView.frame)
        
        // M0
//        UIView.animate(withDuration: 0.3, animations: {
//            animationView.transform = CGAffineTransform(a: 0.8, b: 0, c: 0, d: 0.8, tx: 0, ty: 0)
//        }) { (_) in
//
//        }
        // M1
        UIView.animateKeyframes(withDuration: 0.6, delay: 0, options: [], animations: {
            // 缩小动画
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.6, animations: {
                animationView.transform = CGAffineTransform(a: 0.8, b: 0, c: 0, d: 0.8, tx: 0, ty: 0)
            })
            // 方法的Bounce动画
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4, animations: {
                animationView.transform = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0) // 变回cell一样大
                animationView.frame.origin = CGPoint(x: 0, y: 20)
                toView.transform = CGAffineTransform.identity
                toView.frame.origin = CGPoint(x: 0, y: 0)
            })
            UIView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 0, animations: {
                toController.maskView?.alpha = 0
            })
            // 更你constraints 提早发生
//            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3, animations: {
//                // label的constraint 不能动画
//                toController.coverImageView.layer.cornerRadius = 0
//                toController.coverImageLeading.constant -= 20
//                toController.coverImageTrailing.constant -= 20
//                toController.coverImageHeight.constant = 495
//                toController.view.layoutIfNeeded()
////                UIView.animate(withDuration: 0.3) {
////                    toController.view.layoutIfNeeded()
////                }
//            })
        }) { _ in
            transitionContext.completeTransition(true) // then did appear
            toController.maskView?.removeFromSuperview()
            animationView.removeFromSuperview()
        }
        
        
        // M2
//        UIView.animate(withDuration: stepOneDuration, delay: 0, options: .curveEaseOut, animations: {
//            // move maskView to the top
//            animationView.transform = CGAffineTransform(a: 0.8, b: 0, c: 0, d: 0.8, tx: 0, ty: 0)
//
//        }) { _ in
//
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseInOut, animations: {
//
//                animationView.transform = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0) // 变回cell一样大
//                animationView.frame.origin = CGPoint(x: 0, y: 20)
//                toView.transform = CGAffineTransform.identity
//                toView.frame.origin = CGPoint(x: 0, y: 0)
//
//            }) { _ in
//                transitionContext.completeTransition(true)
//                animationView.removeFromSuperview()
//                toController.maskView?.removeFromSuperview()
//                toController.coverImageView.layer.cornerRadius = 0
//                toController.coverImageLeading.constant -= 20
//                toController.coverImageTrailing.constant -= 20
//                toController.coverImageHeight.constant = 495
//                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
//                    toController.view.layoutIfNeeded()
//                    }, completion: nil)
//
//
//            }

//            UIView.animate(withDuration: stepTwoDuration, delay: 0, options: .curveEaseOut, animations: {
//
//
////                animationView.frame.origin = CGPoint(x: 0, y: 0)
////                animationView.transform = CGAffineTransform(scaleX: 1/0.9, y: 1/0.9) 可以用
//
//                animationView.transform = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0) // 变回cell一样大
//                animationView.frame.origin = CGPoint(x: 0, y: 20)
//
//
//                //                    toView.transform = CGAffineTransform(scaleX: 1, y: stepTwoRatio)
//                toView.transform = CGAffineTransform.identity
//                toView.frame.origin = CGPoint(x: 0, y: 0)
//            }) { _ in
//                animationView.removeFromSuperview() // remove maskView
//                transitionContext.completeTransition(true)
//            }
//        }


    }
    
}
