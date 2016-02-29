//
//  NetWorkingTools.swift
//  SmallBlog
//
//  Created by czljcb on 16/2/29.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import AFNetworking



enum RequestType : String {
    case GET = "GET"
    case POST = "POST"
}


class NetWorkingTools: AFHTTPSessionManager {
    
    static let shareTool: NetWorkingTools = {
        
        var tool = NetWorkingTools()
        
        tool.responseSerializer.acceptableContentTypes?.insert("text/plain")
        
        return tool
    }()
    
    
}


extension NetWorkingTools {
    
    
    func Request( type: RequestType , urlString: String , parameters:[String: AnyObject]? , success: ((data: [String: AnyObject]?) -> Void)? , failure: ((error: NSError) -> ())? ){
        
        let  CZSuccess: (task: NSURLSessionDataTask, anyObject: AnyObject?) -> Void = { (_, anyObject) -> Void in
            
            success!(data: anyObject as! [String: AnyObject]?)
        }
        
        let  CZfailure: (NSURLSessionDataTask?, NSError) -> Void = { (_, error) -> Void in
            
            failure!(error: error)
        }
        
        if type == .GET {
            
            GET(urlString, parameters: parameters,
                             progress: nil,
                              success: CZSuccess,
                              failure:CZfailure)
        }
        else{
            
            POST(urlString, parameters: parameters,
                              progress: nil,
                               success: CZSuccess,
                               failure:CZfailure)
            
        }
        
    }
    
    

    class func getAccessToken(code: String , success: ((data: [String: AnyObject]?) -> Void)? , failure: ((error: NSError) -> ())?  ) {
        let parameters = ["client_id": AppKey,"client_secret": AppSecret,"grant_type": "authorization_code","code": code,"redirect_uri": RedirectURL]
        
        NetWorkingTools.shareTool.Request(.POST, urlString: Oauth2AccessTokenURL, parameters: parameters, success: { (data) -> Void in
            
            success!(data: data)
            
            }) { (error) -> () in
                
                failure!(error: error)
        }
    }
    
    
    class func getUsersShow(userInfo: UserInfo,success: ((data: [String: AnyObject]?) -> Void)? , failure: ((error: NSError?) -> ())? )
        {
//            access_token	true	string	采用OAuth授权方式为必填参数，OAuth授权后获得。
//            uid	false	int64	需要查询的用户ID。
//            screen_name	false	string	需要查询的用户昵称。
            let parameters = ["access_token": userInfo.access_token!, "uid": userInfo.uid!]
            
            NetWorkingTools.shareTool.Request(.GET, urlString: UsersShowURL, parameters: parameters, success: { (data) -> Void in
                
                success!(data: data)

                }) { (error) -> () in
                    failure!(error: error)   
            }
        }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
