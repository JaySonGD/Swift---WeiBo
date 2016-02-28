//
//  UIBarButtonItem+Extension.swift
//  SmallBlog
//
//  Created by czljcb on 16/2/28.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit


extension UIBarButtonItem {
    

    
    
    // MARK: - 类方法
    class func barButtonItem(imageName: String , highlightedImageName: String , target: AnyObject? , action: Selector) -> UIBarButtonItem{
     
        let btn = UIButton(type: .Custom)
        btn.setImage(UIImage(named: imageName), forState: .Normal)
        btn.setImage(UIImage(named: highlightedImageName), forState: .Highlighted)
        btn.sizeToFit()
        
        btn .addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        
        return UIBarButtonItem(customView: btn)
    }
}

