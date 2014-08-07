//
//  CirActivityIndicatorView.swift
//  SwiftStudyiOS
//
//  Created by shuqiong on 8/7/14.
//  Copyright (c) 2014 shuqiong. All rights reserved.
//

import UIKit
import QuartzCore

class CirActivityIndicatorView: UIView {
    
    init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blackColor()
    }
    
    func addDotView() {
        let dotview = DotView(frame: CGRectMake(0, 7, 6, 6))
        self.addSubview(dotview)
        
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = 0
        animation.toValue = 320
        animation.duration = 2.5
        animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.15, 0.6, 0.85, 0.4)
        animation.removedOnCompletion = true
        animation.repeatCount = MAXFLOAT
        
        dotview.layer.addAnimation(animation, forKey: nil)
    }
}

class DotView: UIView {
    
    init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func drawRect(rect: CGRect) {
        
        let path = UIBezierPath(ovalInRect: CGRectMake(0, 0, 6, 6))
        UIColor.whiteColor().setFill()
        path.fill()
    }
}

class WindowView: UIWindow {
    
    init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blackColor()
        self.windowLevel = UIWindowLevelStatusBar // + 1
        
        self.frame = CGRectMake(0, 0, 320, 20)
    }
}
