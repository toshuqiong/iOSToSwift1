//
//  TopMessageView.swift
//  SwiftStudyiOS
//
//  Created by shuqiong on 8/6/14.
//  Copyright (c) 2014 shuqiong. All rights reserved.
//

import UIKit

class TopMessageView: UIView {
    
    var title: NSString?
    var image: UIImage?
    var background: UIColor?
    
    init (title: NSString?, image: UIImage?, background: UIColor?) {
        
        super.init(frame: CGRectMake(0, -20, 320, 20))
        
        self.backgroundColor = UIColor.lightGrayColor()
        
        self.title = title
        self.image = image
        self.background = background
        
        let label = UILabel(frame: CGRectZero)
        label.font = UIFont.systemFontOfSize(13)
        label.textColor = UIColor.blackColor()
        label.text = self.title
        self.addSubview(label)
        label.sizeToFit()
        
        let width = CGRectGetWidth(label.frame)
        var frame = label.frame
        frame.origin.x = (320 - width) / 2
        label.frame = frame
    }

    override func willMoveToSuperview(newSuperview: UIView!) {
        self.alpha = 0
        UIView.animateWithDuration(0.6, animations: {
            self.frame = CGRectMake(0, 0, 320, 20)
            self.alpha = 1
            }, completion: {
                (Bool completion) in
                
                let time = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC*1))
                
                dispatch_after(time, dispatch_get_main_queue(), {
                    self.dismiss()
                    })
            })
    }
    
    func dismiss() {
        UIView.animateWithDuration(0.3, animations: {
            self.alpha = 0
            self.frame = CGRectMake(0, -20, 320, 20)
            }, completion: {
                (Bool completion) in
                self.removeFromSuperview()
            })
    }
}

extension UIViewController {
    
    func showTopMessageView() {
        let topMessageView = TopMessageView(title: "hello,world", image: nil, background: nil)
        self.view.addSubview(topMessageView)
    }
}
