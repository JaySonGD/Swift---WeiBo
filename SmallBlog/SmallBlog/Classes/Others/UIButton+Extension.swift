//
//  Extension.swift
//  SmallBlog
//
//  Created by czljcb on 16/2/27.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

// MARK: - 类扩展
extension UIButton {
    
    // MARK: - 遍历构造函数
    convenience init(image: String , backroundImage: String){
        
        self.init()
        
        setBackgroundImage(UIImage(named:backroundImage ), forState: .Normal)
        setBackgroundImage(UIImage(named:backroundImage + "_highlighted" ), forState: .Highlighted)
        
        setImage(UIImage(named:image ), forState: .Normal)
        setImage(UIImage(named:image + "_highlighted" ), forState: .Highlighted)
        
        sizeToFit()
    }
    
    // MARK: - 类方法
    class func createButton(image: String , backroundImage: String) -> UIButton {
    
        let btn = UIButton(type: .Custom)
        btn.setBackgroundImage(UIImage(named:backroundImage ), forState: .Normal)
        btn.setBackgroundImage(UIImage(named:backroundImage + "_highlighted" ), forState: .Highlighted)
        
        btn.setImage(UIImage(named:image ), forState: .Normal)
        btn.setImage(UIImage(named:image + "_highlighted" ), forState: .Highlighted)
        
        btn.sizeToFit()
        
        return btn
    }
    
}
