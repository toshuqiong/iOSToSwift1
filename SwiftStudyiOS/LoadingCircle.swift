//
//  LoadingCircle.swift
//  SwiftStudyiOS
//
//  Created by shuqiong on 8/7/14.
//  Copyright (c) 2014 shuqiong. All rights reserved.
//

import UIKit
import QuartzCore

class LoadingCircle: CALayer {
    
    var radius: CGFloat
    
    init(radius: CGFloat) {
        self.radius = radius
        super.init()
        self.frame = CGRectMake(0, 120, 320, 200)
        self.setNeedsDisplay()
//        self.backgroundColor = UIColor.redColor().CGColor
    }

    override func drawInContext(ctx: CGContext!) {

        UIGraphicsPushContext(ctx)
        let dash: CGFloat = CGFloat(M_PI_2) * self.radius
        let path = UIBezierPath(
            arcCenter: CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2),
            radius: self.radius,
            startAngle: 0,
            endAngle: CGFloat(M_PI) * 2,
            clockwise: true)
        path.setLineDash([dash * 0.7, dash * 0.3, 3], count: 2, phase: 1)
        path.lineWidth = 6
        path.stroke()
        UIGraphicsPopContext()

        println("frame: \(self.frame)")
//
//        CGContextAddEllipseInRect(ctx, self.frame)
////        CGContextSetFillColorWithColor(ctx, UIColor.blueColor().CGColor)
//        CGContextSetRGBFillColor(ctx, 1, 0, 0, 1)
//        CGContextSetStrokeColorWithColor(ctx, UIColor.redColor().CGColor)
//        CGContextDrawPath(ctx, kCGPathFill)
    }
}

class LoadingCircleView: UIView {
    
    var radius: CGFloat
    
    init(frame: CGRect, radius: CGFloat) {
        self.radius = radius
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
    }
    
    override func drawRect(rect: CGRect) {
//Method 1
//        let path = UIBezierPath(ovalInRect: CGRectMake(0, 0, 100, 100))
//        UIColor.blueColor().setFill()
//        path.fill()
        
//Method 2
//        let context = UIGraphicsGetCurrentContext()
//        CGContextAddEllipseInRect(context, CGRectMake(0, 0, 100, 100))
//        CGContextSetFillColorWithColor(context, UIColor.blueColor().CGColor)
//        CGContextFillPath(context)
        
//Method 6
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), true, 0)
        let path = UIBezierPath(ovalInRect: CGRectMake(0, 0, 100, 100))
        UIColor.blueColor().setFill()
        path.fill()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }

//Method 4
//    override func drawLayer(layer: CALayer!, inContext ctx: CGContext!) {
//
//        CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100))
//        CGContextSetFillColorWithColor(ctx, UIColor.blueColor().CGColor)
//        CGContextFillPath(ctx)
//    }
}

class MyLayerDelegate: NSObject {
    
    override func drawLayer(layer: CALayer!, inContext ctx: CGContext!) {
//Method 3
        UIGraphicsPushContext(ctx)
        
        let path = UIBezierPath(ovalInRect: CGRectMake(0, 0, 100, 100))
        UIColor.blueColor().setFill()
        path.fill()
        
        UIGraphicsPopContext()
    }
}