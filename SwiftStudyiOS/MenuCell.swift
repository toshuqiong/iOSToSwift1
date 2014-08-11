//
//  MenuCell.swift
//  SwiftStudyiOS
//
//  Created by shuqiong on 8/11/14.
//  Copyright (c) 2014 shuqiong. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
        self.selectionStyle = .None
//        let menuView = MenuView(frame: CGRectMake(0, 0, 320, 60))
//        self.contentView.addSubview(menuView)
        
        let pangesture = UIPanGestureRecognizer(target: self, action: "panGesture:")
        self.contentView.addGestureRecognizer(pangesture)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func panGesture(sender: UIPanGestureRecognizer) {
        
        let point = sender.locationInView(self.contentView)
        
    }

}

class MenuView: UIView {
    
    init(frame: CGRect) {
        super.init(frame: frame)
        println("\(1/3)")
        for i in 1..<4 {
            let menuButton = UIButton.buttonWithType(.Custom) as UIButton
            menuButton.frame = CGRectMake(320-40*i, 0, 40, CGRectGetHeight(frame))
            menuButton.backgroundColor = UIColor.redColor()
            menuButton.setImage(UIImage(named: "\(i)Normal"), forState: .Normal)
            self.addSubview(menuButton)
        }
    }
    
    func colorCompents() -> Float {
//     why CGFloat not ok
        return Float( arc4random() % 255 / 255)
    }
}