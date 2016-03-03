//
//  User.swift
//  SmallBlog
//
//  Created by czljcb on 16/3/2.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class User: NSObject {
//    "id": 2324786692,
//    "idstr": "2324786692",
//    "class": 1,
///    "screen_name": "粤港粤好玩",
    var screen_name: String?
    
//    "name": "粤港粤好玩",
//    "province": "44",
//    "city": "1000",
//    "location": "广东",
//    "description": "保护本土文化，劲撑粤语！！粤语地区最地道最好玩既微博～日日有嘢睇，快D关注啦~ 粤港粤好玩~ 一于玩尽拒~ 合作联系QQ：2313678721",
//    "url": "",
///    "profile_image_url": "http://tp1.sinaimg.cn/2324786692/50/5630844023/1",
    var profile_image_url: String?
//    "profile_url": "yueyuok",
//    "domain": "yueyuok",
//    "weihao": "",
//    "gender": "m",
//    "followers_count": 147211,
//    "friends_count": 11,
//    "pagefriends_count": 0,
//    "statuses_count": 38654,
//    "favourites_count": 9,
//    "created_at": "Sat Aug 20 11:39:57 +0800 2011",
//    "following": true,
//    "allow_all_act_msg": false,
//    "geo_enabled": true,
//   "verified": false,

    
///    "verified_type": -1,
    /// 会员等级
    var verified_type: Int = -1
    
//    "remark": "",
//    "ptype": 0,
//    "allow_all_comment": true,
//    "avatar_large": "http://tp1.sinaimg.cn/2324786692/180/5630844023/1",
//    "avatar_hd": "http://ww1.sinaimg.cn/crop.0.0.180.180.1024/8a916e04jw1e8qgp5bmzyj2050050aa8.jpg",
//    "verified_reason": "",
//    "verified_trade": "",
//    "verified_reason_url": "",
//    "verified_source": "",
//    "verified_source_url": "",
//    "follow_me": false,
//    "online_status": 0,
//    "bi_followers_count": 3,
//    "lang": "zh-cn",
//    "star": 0,
//    "mbtype": 0,
///    "mbrank": 0,
    ///
    var mbrank: Int = -1
//    "block_word": 0,
//    "block_app": 0,
//    "credit_score": 70,
//    "user_ability": 8,
//    "urank": 20
    
    
    init(dict: [String: AnyObject]?) {
        super.init()
        setValuesForKeysWithDictionary(dict!)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
