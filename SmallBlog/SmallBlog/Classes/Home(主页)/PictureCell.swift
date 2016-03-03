//
//  PictureCell.swift
//  SmallBlog
//
//  Created by czljcb on 16/3/3.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import SDWebImage

class PictureCell: UICollectionViewCell {
    
    @IBOutlet weak var pictureView: UIImageView!
    
    var imageURL: NSURL?{
        
        didSet{
            
            pictureView .sd_setImageWithURL(imageURL, placeholderImage: UIImage(named: "empty_picture"))
        }
    }
    

}
