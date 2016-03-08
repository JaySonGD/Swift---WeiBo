//
//  SeeBigImageCell.swift
//  SmallBlog
//
//  Created by czljcb on 16/3/4.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import SDWebImage


class SeeBigImageCell: UICollectionViewCell {
    
    // MARK: - 属性
    lazy var imageView: UIImageView = {
        
        let picView = UIImageView()
        picView.contentMode = .ScaleAspectFill
        return picView
    }()
    
    lazy var progessView: ProgessView = {
        
        let progessView = ProgessView()
        progessView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        progessView.center = CGPoint(x: self.bounds.width * 0.5, y: self.bounds.height * 0.5)

        progessView.backgroundColor = UIColor.clearColor()
        return progessView
    }()

    
    
    var imageUrl: NSURL?{
        
        didSet{
            
            progessView.hidden = !true
            imageView.sd_setImageWithURL( largeURL(imageUrl!) , placeholderImage:nil, options: [], progress: { (curSize, totaSize) -> Void in
                
                let progessValue = CGFloat(curSize) / CGFloat(totaSize)
                self.progessView.progessValue = progessValue
                print(progessValue)
                
                }) { (_, _, _, _) -> Void in
                   
                    self.progessView.hidden = true
            }
        }
    }
    
    // ********************************************************************************************************
    // MARK: - < 系统回调方法 >

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.frame = self.contentView.bounds
        
        contentView.addSubview(progessView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ********************************************************************************************************
    // MARK: - < 自定方法 >
    
    private func largeURL(smallURL: NSURL) -> NSURL{
    
        
        
        let urlString = smallURL.absoluteString.stringByReplacingOccurrencesOfString("thumbnail", withString: "large")
        return NSURL(string: urlString)!
    }
    
}
