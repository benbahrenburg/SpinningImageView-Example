//
//  UIView+Rotation.swift
//  SpinningImageView-Example
//
//  Created by Ben Bahrenburg on 7/25/15.
//  Copyright © 2015 Bencoding. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    //Start Rotating view
    func startRotating(duration: Double = 1) {
        let kAnimationKey = "rotation"
        
        if self.layer.animationForKey(kAnimationKey) == nil {
            let animationRotate = CABasicAnimation(keyPath: "transform.rotation")
            
            animationRotate.fromValue = 0.0
            animationRotate.toValue = Float(M_PI * 2.0)
            animationRotate.duration = duration
            animationRotate.repeatCount = Float.infinity
            
            self.layer.addAnimation(animationRotate, forKey: kAnimationKey)
        }
    }
    
    //Stop rotating view
    func stopRotating() {
        let kAnimationKey = "rotation"
        
        if self.layer.animationForKey(kAnimationKey) != nil {
            self.layer.removeAnimationForKey(kAnimationKey)
        }
    }
    
}