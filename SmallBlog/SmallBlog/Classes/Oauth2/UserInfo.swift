//
//  UserInfo.swift
//  SmallBlog
//
//  Created by czljcb on 16/2/29.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class UserInfo: NSObject , NSCoding{
    
    
    // ********************************************************************************************************
    // MARK: - < 属性 >
    
    /// 令牌
    var access_token: String?
    /// 过期时间（s）
    var remind_in: String?{
        didSet{
            
            effective_date = NSDate(timeIntervalSinceNow: NSTimeInterval(remind_in!)!)
        }
    }
    /// 用户ID
    var uid: String?
    /// 昵称
    var screen_name: String?
    /// 头像
    var profile_image_url: String?
    
    var effective_date: NSDate?
    
    
    //var name: String?
    
    override var description: String{
        
        return dictionaryWithValuesForKeys(["access_token","remind_in","uid","screen_name","effective_date","profile_image_url"]).description
    }
    
    
    
    // ********************************************************************************************************
    // MARK: - < 系统方法 >
    
    override init() {
        
    }
    init(dict: [String: AnyObject]) {
       
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    // ********************************************************************************************************
    // MARK: - < 编码、解码 >
    required init?(coder aDecoder: NSCoder) {
        
        access_token = aDecoder.decodeObjectForKey("access_token") as? String
        uid = aDecoder.decodeObjectForKey("uid") as? String
        screen_name = aDecoder.decodeObjectForKey("screen_name") as? String
        effective_date = aDecoder.decodeObjectForKey("effective_date") as? NSDate
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(access_token, forKey: "access_token")
        aCoder.encodeObject(uid, forKey: "uid")
        aCoder.encodeObject(screen_name, forKey: "screen_name")
        aCoder.encodeObject(effective_date, forKey: "effective_date")
    }
    
    // ********************************************************************************************************
    // MARK: - < 读写数据 >
    
    func saveUserInfo(){
        
        NSKeyedArchiver.archiveRootObject(self, toFile: UserInfoPath)
    }
    
    
    func readUserInfo() -> UserInfo{
        
        return  NSKeyedUnarchiver.unarchiveObjectWithFile(UserInfoPath) as! UserInfo
    }
    
}


