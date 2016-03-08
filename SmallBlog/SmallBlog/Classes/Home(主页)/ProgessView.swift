//
//  ProgessView.swift
//  SmallBlog
//
//  Created by czljcb on 16/3/4.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class ProgessView: UIView {

    
    var progessValue: CGFloat = 0 {
        
        didSet{
            
            setNeedsDisplay()
        }
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        super.drawRect(rect)
        
        let center = CGPoint(x: rect.size.width * 0.5 , y: rect.size.height * 0.5)
        let radius = rect.size.width * 0.5 - 4
        let startAngle = CGFloat(-M_2_PI)
        let endAngle = CGFloat(M_PI * 2) * progessValue  + startAngle
        
        var path = UIBezierPath(arcCenter: center, radius: rect.size.width * 0.5-2, startAngle: startAngle, endAngle: CGFloat(M_PI * 2)  + startAngle, clockwise: true)
        path.lineWidth = 1
        UIColor.whiteColor().setStroke()
        path.stroke()

        
         path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle:  endAngle, clockwise: true)
        
        path .addLineToPoint(center)
        path.closePath()
        
        UIColor.lightGrayColor().setFill()
        path.fill()

    }


}
