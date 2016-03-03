//
//  UserInfoModel.swift
//  SmallBlog
//
//  Created by czljcb on 16/3/1.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class UserInfoModel {

    // MARK: - 属性
    
    
    /// 单例
    //static let shareUserInfoModel :UserInfoModel = UserInfoModel()
    static let shareUserInfoModel :UserInfoModel = {
        
        return UserInfoModel()
    }()

    /// 是否过期
    var effective_in: Bool{
        
      return ( userInfo?.effective_date?.compare(NSDate()) == NSComparisonResult.OrderedAscending )
    }
    
    var userInfo: UserInfo?
    
    /// 是否登录过
    var isLogin: Bool{
        
        return (userInfo != nil) && (!effective_in)
    }
    
    /// 头像URL
    var profileImageUrl: NSURL?{
        return NSURL(string: userInfo?.profile_image_url ?? "")
    }


    
    init(){
        
        userInfo = NSKeyedUnarchiver.unarchiveObjectWithFile(UserInfoPath) as? UserInfo
    }
    
}
