//
//  Common.swift
//  SmallBlog
//
//  Created by czljcb on 16/2/29.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import Foundation


let AppKey = "730946570"
let AppSecret = "70b04905fccf533301b2f5424e4829d5"

/// 会掉地址
let RedirectURL = "http://blog.csdn.net/czljcb"


let Oauth2AuthorizeURL = "https://api.weibo.com/oauth2/authorize?client_id=\(AppKey)&redirect_uri=\(RedirectURL)"
let Oauth2AccessTokenURL = "https://api.weibo.com/oauth2/access_token"

/// 获取用户URL
let UsersShowURL = "https://api.weibo.com/2/users/show.json"

/// 主页微博
let StatusesHomeTimeLineURL = "https://api.weibo.com/2/statuses/home_timeline.json"

/// UserInfo路径
let UserInfoPath = ((NSSearchPathForDirectoriesInDomains( .DocumentDirectory,.UserDomainMask, true).last)! as NSString).stringByAppendingPathComponent("userInfo.plist")

/// 自动填充账号和密码
let JavaScriptCode = "document.getElementById('userId').value='13760004725';document.getElementById('passwd').value='czljcb';"
//let JavaScriptCode = "document.getElementById('userId').value='czljcb@163.com';document.getElementById('passwd').value='137291';"

