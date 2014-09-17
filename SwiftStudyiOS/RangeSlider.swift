//
//  RangeSlider.swift
//  SwiftStudyiOS
//
//  Created by shuqiong on 9/1/14.
//  Copyright (c) 2014 shuqiong. All rights reserved.
//

import UIKit
import QuartzCore

class RangeSlider: UIControl {
    
    var minimumValue = 0.0
    var maximumValue = 1.0
    var lowerValue = 0.2
    var upperValue = 0.8

    let trackLayer = CALayer()
    let lowerThumbLayer = CALayer()
    let upperThumbLayer = CALayer()
    
    var thumbWidth: CGFloat {
        return CGFloat(bounds.height)
    }
    
    init(frame: CGRect) {
        super.init(frame: frame)
        
        trackLayer.backgroundColor = UIColor.blueColor().CGColor
        layer.addSublayer(trackLayer)
        
        lowerThumbLayer.backgroundColor = UIColor.greenColor().CGColor
        self.layer.addSublayer(lowerThumbLayer)
        
        upperThumbLayer.backgroundColor = UIColor.greenColor().CGColor
        layer.addSublayer(upperThumbLayer)
        
        updateLayerFrames()
    }
    
    override var frame: CGRect {
        didSet {
            updateLayerFrames()
        }
    }

    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    func updateLayerFrames() {
        
        trackLayer.frame = bounds.rectByInsetting(dx: 0.0, dy: bounds.height/3)
        trackLayer.setNeedsDisplay()
        
        let lowerThumbCenter = CGFloat(positionForValue(lowerValue))
        
        lowerThumbLayer.frame = CGRect(x: lowerThumbCenter - thumbWidth / 2.0, y: 0.0, width: thumbWidth, height: thumbWidth)
        lowerThumbLayer.setNeedsDisplay()
        
        let upperThumbCenter = CGFloat(positionForValue(upperValue))
        
        upperThumbLayer.frame = CGRect(x: upperThumbCenter - thumbWidth / 2, y: 0.0, width: thumbWidth, height: thumbWidth)
        upperThumbLayer.setNeedsDisplay()
    }
    
    func positionForValue(value: Double) -> Double {
        
        let widthDouble = Double(thumbWidth)
        return Double(bounds.width - thumbWidth) * (value - minimumValue) / (maximumValue - minimumValue) + Double(thumbWidth / 2.0)
    }
}
