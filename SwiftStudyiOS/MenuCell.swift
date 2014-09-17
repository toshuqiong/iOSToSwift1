//
//  MenuCell.swift
//  SwiftStudyiOS
//
//  Created by shuqiong on 8/11/14.
//  Copyright (c) 2014 shuqiong. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    var contentImage: UIImageView?
    
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Initialization code
        self.selectionStyle = .None
        let menuView = MenuView(frame: CGRectMake(0, 0, 320, 60))
//        self.contentView.addSubview(menuView)
        
//        let pangesture = UIPanGestureRecognizer(target: self, action: "panGesture:")
//        self.contentView.addGestureRecognizer(pangesture)
        
        let view = UIView(frame: CGRectMake(0, 0, 320, 120))
        view.clipsToBounds = true
//        self.contentView.clipsToBounds = true
        self.contentView.backgroundColor = UIColor.blackColor()
        
        self.contentImage = UIImageView(frame: CGRectMake(0, -40, 320, 200))

//        self.contentImage!.frame = CGRectMake(0, 0, 320, 120)
//        self.contentView.addSubview(self.contentImage)
        
        view.addSubview(self.contentImage)
        self.contentView.addSubview(view)
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
        
        sender.setTranslation(CGPointZero, inView: self.contentView)
    }
    
    func setContent(content: AnyObject?, indexPath: NSIndexPath) {
        
        
        self.contentImage!.image = UIImage(named: "demo_\(indexPath.row%3 + 1).jpg")
    }
    
    func cellOnTableView(tableview: UITableView, didScrollOnView view: UIView) {

        let rectInSuperview = tableview.convertRect(self.frame, toView: view)
        let distanceFromCenter = CGRectGetHeight(view.frame) / 2 - CGRectGetMinY(rectInSuperview)
        let difference = CGRectGetHeight(self.contentImage!.frame) - CGRectGetHeight(self.frame)
        let move = distanceFromCenter / CGRectGetHeight(view.frame) * difference
        var imageRect = self.contentImage!.frame
        
        imageRect.origin.y = -(difference / 2) + move
        self.contentImage!.frame = imageRect
        
//        println("*********************\(rectInSuperview), \(distanceFromCenter), \(difference), \(move), \(imageRect)---------------")
    }
}

class MenuView: UIView {
    
    init(frame: CGRect) {
        super.init(frame: frame)
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