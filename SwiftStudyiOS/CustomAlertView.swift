//
//  CustomAlertView.swift
//  SwiftStudyiOS
//
//  Created by shuqiong on 8/8/14.
//  Copyright (c) 2014 shuqiong. All rights reserved.
//

import UIKit

protocol CustomAlertViewDelegate: NSObjectProtocol {
    
    func customAlertView(alertView: CustomAlertView, clickedButtonAtIndex index: Int)
}

let width: CGFloat = 280.0
let height: CGFloat = 140
let padding: CGFloat = 10.0
let labelHeight: CGFloat = 21

class CustomAlertView: UIView {

    private var customeMaskView: UIView?
    var delegate: CustomAlertViewDelegate?
    
    init(title: String, content: String, buttons: [String]) {
        super.init(frame: CGRectZero)
        self.frame = CGRectMake(20, 120, width, height)
        self.backgroundColor = UIColor.whiteColor()
        self.layer.cornerRadius = 5

        let labelTitle = UILabel(frame: CGRectMake(padding, padding, width-2*padding, labelHeight))
        labelTitle.textAlignment = .Center
        labelTitle.font = UIFont.systemFontOfSize(15)
        labelTitle.text = title
        self.addSubview(labelTitle)
        
        let labelContent = UILabel(frame: CGRectMake(padding, 2*padding+labelHeight, width-2*padding, labelHeight))
        labelContent.textAlignment = .Center
        labelContent.font = UIFont.systemFontOfSize(13)
        labelContent.textColor = UIColor.grayColor()
        labelContent.text = content
        self.addSubview(labelContent)
        
        for var i = 0; i < buttons.count; i++ {
            
            let btnTitle = buttons[i]
            let button = UIButton.buttonWithType(.Custom) as UIButton
            
            button.setImage(self.drawImageWithColor(UIColor.purpleColor(), title: btnTitle), forState: .Normal)
            button.setTitleColor(UIColor.redColor(), forState: .Highlighted)
            button.setTitleColor(UIColor.redColor(), forState: .Selected)
            button.setImage(self.drawImageWithColor(UIColor.redColor(), title: btnTitle), forState: .Highlighted)
            button.frame = CGRectMake(20*(i+1) + 110*CGFloat(i), 90, 110, 30)
            button.tag = i
            button.layer.cornerRadius = 5
            button.layer.masksToBounds = true
            button.addTarget(self, action: "buttonClickedAction:", forControlEvents: .TouchUpInside)
            self.addSubview(button)
        }
    }
    
    func buttonClickedAction(sender: UIButton) {
        self.delegate!.customAlertView(self, clickedButtonAtIndex: sender.tag)
        self.removeFromSuperview()
//        println("self.viewcontroller: \(self.selfViewController())")
    }
    
    func show() {
        let topViewController = self.appRootViewController()
        topViewController.view.addSubview(self)
    }
    
    override func willMoveToSuperview(newSuperview: UIView!) {
        
        if newSuperview == nil {
            return
        }
        
        let topViewController = self.appRootViewController()
        
        customeMaskView = UIView(frame: topViewController.view.bounds)
        customeMaskView!.backgroundColor = UIColor.blackColor()
        customeMaskView!.alpha = 0.5
        topViewController.view.addSubview(customeMaskView)
        
        super.willMoveToSuperview(newSuperview)
    }
    
    override func willRemoveSubview(subview: UIView!) {

        customeMaskView!.removeFromSuperview()
        super.willRemoveSubview(subview)
    }
    
    func appRootViewController() -> UIViewController {
        let rootViewController = UIApplication.sharedApplication().delegate.window!.rootViewController
        var topViewController = rootViewController
        while topViewController.presentedViewController {
            topViewController = topViewController.presentedViewController
        }
        return topViewController
    }
    
    func selfViewController() -> UIViewController? {

        for var next:UIView=self.superview; next != nil; next = next.superview {
            let nextResponder = next.nextResponder()
            if nextResponder.isKindOfClass(UIViewController.classForCoder()) {
                if nextResponder.isKindOfClass(UINavigationController.classForCoder()) {
                    let naviController = nextResponder as? UINavigationController
                    return naviController!.topViewController
                }
                return nextResponder as? UIViewController
            }
        }
        return nil
    }
    
    func drawImageWithColor(color: UIColor, title: NSString) -> UIImage? {

        UIGraphicsBeginImageContext(CGSizeMake(110, 30))
        
        var ctx = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(ctx, color.CGColor)
        CGContextFillRect(ctx, CGRectMake(0, 0, 110, 30))
        
        let textSize = title.sizeWithAttributes([NSFontAttributeName: UIFont.systemFontOfSize(15.0)])
        
        title.drawInRect(CGRectMake((110-textSize.width)/2, (30-textSize.height)/2, textSize.width, textSize.height), withAttributes: [NSFontAttributeName: UIFont.systemFontOfSize(15.0), NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return image
    }
}
