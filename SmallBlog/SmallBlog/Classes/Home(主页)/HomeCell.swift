//
//  HomeCell.swift
//  SmallBlog
//
//  Created by czljcb on 16/3/2.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import SDWebImage

let width3x = (UIScreen.mainScreen().bounds.size.width - 40) / 3
let width2x = (UIScreen.mainScreen().bounds.size.width - 30.0) / 2.0


class HomeCell: UITableViewCell {

    // MARK: - 属性
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var verifiedTypeImageView: UIImageView!
    @IBOutlet weak var createdAtLable: UILabel!
    @IBOutlet weak var vipImageView: UIImageView!
    @IBOutlet weak var textLable: UILabel!
    @IBOutlet weak var sourceLable: UILabel!
    @IBOutlet weak var screenNameLable: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var collectionViewRB: NSLayoutConstraint!
    
    
    @IBOutlet weak var collectionViewHB: NSLayoutConstraint!
    
    ///
    @IBOutlet weak var collectionViewBB: NSLayoutConstraint!
    var status: StatusDataModel?{
        
        didSet{
            
//            profileImageView.sd_setImageWithURL(status!.profileImageURL, placeholderImage: UIImage(named: "avatar_default"))
            profileImageView.sd_setImageWithURL(status!.profileImageURL, placeholderImage:  UIImage(named: "avatar_default")) { (image, _, _, _) -> Void in
                self.profileImageView.image = image.imageWithBorderAndColor(0, color: UIColor.orangeColor())
            }
            ///
            createdAtLable.text = status?.createdAtString
            
            screenNameLable.text = status?.status?.user?.screen_name
            
            textLable.text = status?.status?.text
            
            sourceLable.text = status?.sourceString
            
            vipImageView.image = status?.vipImage
            
            verifiedTypeImageView.image = status?.verifiedImage
            
            var count = status?.picUrls?.count
            let latOut = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            collectionViewBB.constant = 10;

            if count == 4 {
                
                count = (count! - 1 )/2 + 1
                collectionViewHB.constant = CGFloat( count!) * width2x + (CGFloat( count!) - 1) * 10.0
                latOut.itemSize = CGSize(width: width2x, height: width2x)

            }
            else if  count > 0 {
                count = (count! - 1 )/3 + 1
                collectionViewHB.constant = CGFloat( count!) * width3x + (CGFloat( count!) - 1) * 10.0
                latOut.itemSize = CGSize(width: width3x, height: width3x)
            }
            else
            {
                collectionViewHB.constant = 0
                collectionViewBB.constant = 0;
            }
            collectionView.reloadData()

            
            
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
}




extension HomeCell: UICollectionViewDataSource{
 
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return status?.picUrls?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! PictureCell
        
        cell.backgroundColor = UIColor.orangeColor()
        cell.imageURL = status?.picUrls![indexPath.row]
        
        
        return cell
    }
}
