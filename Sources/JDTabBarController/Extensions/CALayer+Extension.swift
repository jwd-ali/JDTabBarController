//
//  CALayer+Extension.swift
//  JDTabBarController
//
//  Created by Jawad Ali on 05/09/2020.
//

import UIKit
public extension CALayer {
     func animateShapeSpring(from startX : CGFloat , endX: CGFloat) {
        let total = abs(startX - endX)
        let caframeAnimation = CASpringAnimation(keyPath: "position.x")
        caframeAnimation.fromValue = startX
        caframeAnimation.toValue = endX
        caframeAnimation.damping = total/50 + 5
        caframeAnimation.duration = caframeAnimation.settlingDuration
        caframeAnimation.fillMode = .both
        caframeAnimation.isRemovedOnCompletion = false
        self.add(caframeAnimation, forKey: "circleLayerAnimationKey")
    }
    
    func aimateReverseForward(from startX : CGFloat , endX: CGFloat) {
        let total = (startX - endX)
        let animation = CAKeyframeAnimation(keyPath: "position.x")
        animation.values = [startX, total>0 ? startX + 40 : startX - 40, endX]
        animation.keyTimes = [0,0.4,1]
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        animation.duration = 0.5
        self.add(animation, forKey: "Reposition")
        
        
        let boundsOvershootAnimation = CAKeyframeAnimation(keyPath: "transform")

        let startingScale = CATransform3DScale(self.transform, 1, 1, 1)
        let overshootScale = CATransform3DScale(self.transform, 0.5, 1, 0.5)
        let endingScale = self.transform
        
        boundsOvershootAnimation.values = [startingScale, overshootScale, endingScale]
        boundsOvershootAnimation.keyTimes = [0.0, 0.4, 1.0].map { NSNumber(value: $0) }
        boundsOvershootAnimation.duration = 0.5
        boundsOvershootAnimation.isRemovedOnCompletion = false
        boundsOvershootAnimation.fillMode = .forwards
        
        self.add(boundsOvershootAnimation, forKey: "scale")
        
    }
    
    func aimateJelly(from startX : CGFloat , endX: CGFloat) {
        let total = (startX - endX)
        let bubblePositionAnim = CAKeyframeAnimation(keyPath: "position.x")
        bubblePositionAnim.values = [startX, (total>0 ? startX + 30 : startX - 30),(total>0 ? endX - 5 : endX + 5), endX]
        bubblePositionAnim.keyTimes = [0,0.4,0.7,1]
        
        let bubbleTransformAnim      = CAKeyframeAnimation(keyPath: "transform")
        bubbleTransformAnim.values   = [CATransform3DIdentity,
                                        CATransform3DScale(self.transform, 1.5, 1.5, 1.5),
                                        CATransform3DMakeScale(0.8, 1, 1),
                                        CATransform3DIdentity]
        
        bubbleTransformAnim.keyTimes = [0, NSNumber(value: 1.0 / 3.0), NSNumber(value: 2.0 / 3.0),  1]
        let bubbleGroupAnim = CAAnimationGroup()
        bubbleGroupAnim.animations = [bubbleTransformAnim, bubblePositionAnim]
        bubbleGroupAnim.isRemovedOnCompletion = false
        bubbleGroupAnim.fillMode = CAMediaTimingFillMode.forwards
        bubbleGroupAnim.duration = 0.8
        
        
        self.add(bubbleGroupAnim, forKey: nil)
        
    }
    
}
