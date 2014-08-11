//
//  ViewController1.swift
//  SwiftStudyiOS
//
//  Created by shuqiong on 8/8/14.
//  Copyright (c) 2014 shuqiong. All rights reserved.
//

import UIKit

class ViewController1: UIViewController, CustomAlertViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        if self.respondsToSelector("edgesForExtendedLayout") {
            self.edgesForExtendedLayout = .None
        }
        
        let button = UIButton.buttonWithType(.System) as UIButton
        button.frame = CGRectMake(100, 40, 120, 40)
        button.setTitle("showAlertView", forState: .Normal)
        button.addTarget(self, action: "showAlertView", forControlEvents: .TouchUpInside)
        self.view.addSubview(button)        
        
//        var seconds = 0.0
//        let frac = modf(NSDate().timeIntervalSince1970, &seconds)
//        
//        let nsec: Double = frac * Double(NSEC_PER_SEC)
//        var walltime = timespec(tv_sec: CLong(seconds), tv_nsec: CLong(nsec))
//        
//        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
//        let timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
//        dispatch_source_set_timer(timer, dispatch_walltime(&walltime, 0), 0, 0)
    }
    
    func showAlertView() {
        let customeAlertView = CustomAlertView(title: "自定义AlertView", content: "这是一个自定义的AlertView", buttons: ["ok", "cancel"])
        
        customeAlertView.delegate = self
        customeAlertView.show()
    }
    
    func customAlertView(alertView: CustomAlertView, clickedButtonAtIndex index: Int) {
        println("clickedbutton at index: \(index)")
        let viewcontroller = ViewController2()
        self.navigationController.pushViewController(viewcontroller, animated: true)
    }
}
