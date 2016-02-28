//
//  VisitorView.swift
//  SmallBlog
//
//  Created by czljcb on 16/2/27.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class VisitorView: UIView {


    // MARK: - < 属性 >
    
    @IBOutlet weak var rotationView: UIImageView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var textLable: UILabel!
    
    
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    // MARK: - < load view >

    class func visitorView() -> VisitorView{
        return NSBundle.mainBundle().loadNibNamed("VisitorView", owner: nil, options: nil).last as! VisitorView
    }
    
    
    // MARK: - < rotationAnima >
    
    func rotationAnima(){
        
        let anima = CABasicAnimation(keyPath: "transform.rotation.z")
        anima.fromValue = 0

        anima.toValue = M_PI * 2
        anima.duration = 10;
        anima.repeatCount = MAXFLOAT
        anima.removedOnCompletion = false
        
        rotationView.layer .addAnimation(anima, forKey: nil)
    }

    // MARK: - < 自定义方法 >
    
    func setVisitorViewInfo(icon: String , title: String){
        iconView.image = UIImage(named: icon)
        textLable.text = title
        rotationView.hidden = true
    }
    


}
