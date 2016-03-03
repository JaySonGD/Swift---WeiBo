//
//  StatusDataModel.swift
//  SmallBlog
//
//  Created by czljcb on 16/3/2.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit


class StatusDataModel {
    
    var status: Status?
    
    var profileImageURL: NSURL?
    
    var sourceString: String?
    
    var verifiedImage: UIImage?
    
    var vipImage: UIImage?
    
    var picUrls: [NSURL]? = [NSURL]()
    
    var createdAtString: String?{
        
        let fmt = NSDateFormatter()
        fmt.dateFormat = "EEE MM dd HH:mm:ss Z yyyy"
        fmt.locale = NSLocale(localeIdentifier: "en")
        return fmt.dateFromString((status?.created_at)!)!.stringWithDate()
    }
    
    init(status: Status){
        
        self.status = status
        
        profileImageURL = NSURL(string: (status.user?.profile_image_url)!)
        
        sourceString = (status.source! as NSString).componentsSeparatedByString("\">").last?.componentsSeparatedByString("</").first
        
        // 3.处理认证图片
        let verifiedType = status.user?.verified_type ?? -1
        switch verifiedType {
        case 0:
            vipImage = UIImage(named: "avatar_vip")
        case 2, 3, 5:
            vipImage = UIImage(named: "avatar_enterprise_vip")
        case 220:
            vipImage = UIImage(named: "avatar_grassroot")
        default:
            vipImage = nil
        }
        
        // 4.处理会员的图片
        let vipRank = status.user?.mbrank ?? -1
        if vipRank >= 1 && vipRank <= 6 {
            verifiedImage = UIImage(named: "common_icon_membership_level\(vipRank)")
        }
        
        for picUrlDict in status.pic_urls!{
            
            let url = NSURL(string:picUrlDict["thumbnail_pic"] as! String)!
            picUrls?.append(url)
        }
    }

}