//
//  TitleButton.swift
//  SmallBlog
//
//  Created by czljcb on 16/2/28.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class TitleButton: UIButton {

//    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
//        
//    }
//    
//    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
//        
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = (titleLabel?.frame.size.width ?? 0) + 5
    }
}
