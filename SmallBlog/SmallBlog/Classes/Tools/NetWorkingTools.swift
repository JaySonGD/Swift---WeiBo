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
        
//        client_id	true	string	申请应用时分配的AppKey。
//        client_secret	true	string	申请应用时分配的AppSecret。
//        grant_type	true	string	请求的类型，填写authorization_code
//        
//        grant_type为authorization_code时
//        必选	类型及范围	说明
//        code	true	string	调用authorize获得的code值。
//        redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。

        let parameters = ["client_id": AppKey,"client_secret": AppSecret,"grant_type": "authorization_code","code": code,"redirect_uri": RedirectURL]
        
        NetWorkingTools.shareTool.Request(.POST, urlString: Oauth2AccessTokenURL, parameters: parameters, success: { (data) -> Void in
            
            success!(data: data)
            
            }) { (error) -> () in
                
                failure!(error: error)
        }
    }
    
}
