//
//  UIView+Rotation.swift
//  SpinningImageView-Example
//
//  Created by Ben Bahrenburg on 7/25/15.
//  Copyright © 2015 Bencoding. All rights reserved.
//

import Foundation
import UIKit

//Const used by this extension
let kBXBExtForAnimationKey = "rotation"

extension UIView {
    
    //Start Rotating view
    func startRotating(duration: Double = 1) {
        if self.layer.animationForKey(kBXBExtForAnimationKey) == nil {
            let animationRotate = CABasicAnimation(keyPath: "transform.rotation")
            
            animationRotate.fromValue = 0.0
            animationRotate.toValue = Float(M_PI * 2.0)
            animationRotate.duration = duration
            animationRotate.repeatCount = Float.infinity
            
            self.layer.addAnimation(animationRotate, forKey: kBXBExtForAnimationKey)
        }
    }
    
    //Stop rotating view
    func stopRotating() {
        if self.layer.animationForKey(kBXBExtForAnimationKey) != nil {
            self.layer.removeAnimationForKey(kBXBExtForAnimationKey)
        }
    }
    
}