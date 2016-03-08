//
//  Status.swift
//  SmallBlog
//
//  Created by czljcb on 16/3/2.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class Status: NSObject {
    
///    "created_at": "Wed Mar 02 18:56:01 +0800 2016",
    var created_at: String?
    
//    "id": 3948654932805791,
//    "mid": "3948654932805791",
///    "idstr": "3948654932805791",
    var idstr: String?
    
///    "text": "愿你 此后做的每一个选择都是为了自己",
    var text: String?
    
//    "source_allowclick": 0,
//    "source_type": 1,
///    "source": "<a href=\"http://app.weibo.com/t/feed/7nlRf\" rel=\"nofollow\">我的微播炉</a>",
    var source: String?
//    "favorited": false,
//    "truncated": false,
//    "in_reply_to_status_id": "",
//    "in_reply_to_user_id": "",
//    "in_reply_to_screen_name": "",
///    "pic_urls": [ ],
    var pic_urls: [[String: AnyObject]]? = [[String: AnyObject]]()
//    "geo": null,
///    "user": {},
    var user: User?
    
//    "retweeted_status": {},
//    "reposts_count": 0,
//    "comments_count": 0,
//    "attitudes_count": 0,
//    "isLongText": false,
//    "mlevel": 0,
//    "visible": {},
//    "biz_feature": 0,
//    "darwin_tags": [ ],
//    "hot_weibo_tags": [ ],
//    "rid": "0_0_1_2666870401024669652",
//    "userType": 0
    
    init(dict: [String: AnyObject]?) {
        super.init()
        setValuesForKeysWithDictionary(dict!)
        
        user = User(dict: dict!["user"]! as? [String : AnyObject] )
    }

    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
