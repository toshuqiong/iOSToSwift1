//
//  ViewController.swift
//  SwiftStudyiOS
//
//  Created by shuqiong on 8/6/14.
//  Copyright (c) 2014 shuqiong. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    var activityIndicator: CirActivityIndicatorView?
    var addDotTime: NSTimer?
    var dotCount: Int = 1
    var windowview: WindowView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.title = "Root"
        
        if self.respondsToSelector("edgesForExtendedLayout") {
            self.edgesForExtendedLayout = .None
        }
        
        let button = UIButton.buttonWithType(.System) as UIButton
        button.frame = CGRectMake(30, 80, 120, 40)
        button.titleLabel.font = UIFont.systemFontOfSize(15.0)
        button.setTitle("topmessage", forState: .Normal)
        
        button.addTarget(self, action: "topmessage", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(button)
        
        let button1 = UIButton.buttonWithType(.System) as UIButton
        button1.frame = CGRectMake(170, 80, 120, 40)
        button1.titleLabel.font = UIFont.systemFontOfSize(15.0)
        button1.setTitle("showActivity", forState: .Normal)
        
        button1.addTarget(self, action: "toggleActivityIndicator", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(button1)

        
        let loadingCircle1 = LoadingCircle(radius: 30)
        self.view.layer.addSublayer(loadingCircle1)
        
        let animation1 = CABasicAnimation(keyPath: "transform.rotation")
        animation1.fromValue = 0
        animation1.toValue = MAXFLOAT
        animation1.duration = CFTimeInterval(MAXFLOAT) * 0.7
        
        loadingCircle1.addAnimation(animation1, forKey: nil)
        
        let loadingCircle2 = LoadingCircle(radius: 20)
        self.view.layer.addSublayer(loadingCircle2)
        
        let animation2 = CABasicAnimation(keyPath: "transform.rotation")
        animation2.fromValue = 0
        animation2.toValue = -MAXFLOAT
        animation2.duration = CFTimeInterval(MAXFLOAT) * 0.7
        
        loadingCircle2.addAnimation(animation2, forKey: nil)

        
        let loadingCircle3 = LoadingCircle(radius: 10)
        self.view.layer.addSublayer(loadingCircle3)
        
        let animation3 = CABasicAnimation(keyPath: "transform.rotation")
        animation3.fromValue = 0
        animation3.toValue = MAXFLOAT
        animation3.duration = CFTimeInterval(MAXFLOAT) * 0.7
        
        loadingCircle3.addAnimation(animation3, forKey: nil)

//        error!!!!
//        let loadingCircleView = LoadingCircleView(frame: self.view.bounds, radius: 30)
//////Method 3
////        let myLayer = CALayer()
////        let myLayerDelegate = MyLayerDelegate()
////        myLayer.delegate = myLayerDelegate
////        loadingCircleView.layer.addSublayer(myLayer)
////        loadingCircleView.setNeedsDisplay()
//        self.view.addSubview(loadingCircleView)
    
        activityIndicator = CirActivityIndicatorView(frame: CGRectMake(0, 40, 320, 20))
        activityIndicator!.addDotView()
//        self.view.addSubview(activityIndicator)
        
        addDotTime = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: Selector("addDot"), userInfo: nil, repeats: true)
        
        
        windowview = WindowView(frame: CGRectMake(0, 0, 320, 20))
        windowview!.hidden = false
        activityIndicator!.frame = CGRectMake(0, 0, 320, 20)
        windowview!.addSubview(activityIndicator)
        
        let nextControllerButton = UIButton.buttonWithType(.System) as UIButton
        nextControllerButton.frame = CGRectMake(100, 40, 120, 40)
        nextControllerButton.titleLabel.font = UIFont.systemFontOfSize(15)
        nextControllerButton.setTitle("next", forState: .Normal)
        nextControllerButton.addTarget(self, action: "pushController:", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(nextControllerButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func topmessage() {
        println("button clicked")
        self.showTopMessageView()
    }
    
    func toggleActivityIndicator() {
        
        UIView.animateWithDuration(1, animations: {
            let alpha = self.windowview!.hidden ? 1.0 : 0.0
            self.windowview!.alpha = CGFloat(alpha)
            }, completion: {
                (Bool completion) in
                self.windowview!.hidden = !self.windowview!.hidden
            })
    }
    
    func addDot() {
        if dotCount >= 4 {
            addDotTime!.invalidate()
            return
        }
        activityIndicator!.addDotView()
        ++dotCount
    }
    
    func pushController(sender: UIButton) {
        let controller = ViewController1()
        controller.title = "SECOND"
        self.navigationController.pushViewController(controller, animated: true)
    }
}

