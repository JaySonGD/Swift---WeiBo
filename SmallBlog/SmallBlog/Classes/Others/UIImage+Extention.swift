//
//  UIImage+Extention.swift
//  SmallBlog
//
//  Created by czljcb on 16/3/3.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit


extension UIImage{
    
    
    
    func imageWithBorderAndColor(borderWH: CGFloat,color: UIColor) -> UIImage{
        
        let  size = CGSize(width: self.size.width + 2 * borderWH,  height: self.size.height + 2 * borderWH)
        UIGraphicsBeginImageContextWithOptions(size, !true, 0)
        var path = UIBezierPath(ovalInRect: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        color.set()
        path.fill()
        path = UIBezierPath(ovalInRect: CGRect(x: borderWH, y: borderWH, width: self.size.width , height: self.size.height))

        path.addClip()
        
        self.drawAtPoint(CGPoint(x: borderWH, y: borderWH))
        
        let image =  UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
        
    }

    
    
    
    
    
    
    
}
