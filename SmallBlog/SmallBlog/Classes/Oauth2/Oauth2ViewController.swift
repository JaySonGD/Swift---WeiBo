//
//  Oauth2ViewController.swift
//  SmallBlog
//
//  Created by czljcb on 16/2/29.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import SVProgressHUD


class Oauth2ViewController: UIViewController {
    
    
    // MARK: - 属性
    @IBOutlet weak var loginView: UIWebView!
    
    // ********************************************************************************************************
    // MARK: - < 系统会掉函数 >
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        navigationItem.title = "登录页面"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .Done, target: self, action: "closeLogin")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "填充", style: .Done, target: self, action: "autoLogin")
        
        guard let url = NSURL(string: Oauth2AuthorizeURL) else{
            return
        }
        
        
        let request = NSURLRequest(URL: url)
        loginView.loadRequest(request)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ********************************************************************************************************
    // MARK: - < 事件监听 >
    @objc private func closeLogin(){
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @objc private func autoLogin(){
        
        loginView.stringByEvaluatingJavaScriptFromString(JavaScriptCode)
    }
    
    
    
}


extension Oauth2ViewController: UIWebViewDelegate{
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        
        SVProgressHUD.dismiss()
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
        
    }
    func webViewDidStartLoad(webView: UIWebView) {
        SVProgressHUD .show()
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        print(request.URL?.absoluteString)
        
        guard let urlString = request.URL?.absoluteString else{
            print("还没有urlstring")
            return true
        }
        guard urlString.containsString("code=") else {
            print("还没有加载code,继续加载页面")
            return true
        }
        guard let code = urlString.componentsSeparatedByString("code=").last else{
            print("还没有加载到code,继续加载页面")
            return true
        }
        
        NetWorkingTools.getAccessToken(code, success: { (data) -> Void in
            
            let userInfo = UserInfo(dict: data!)
            NetWorkingTools.getUsersShow(userInfo, success: { (data) -> Void in
                
                userInfo.screen_name = data!["screen_name"] as? String
                userInfo.profile_image_url = data!["profile_image_url"] as? String
                
                print((data! as NSDictionary))
                
                userInfo.saveUserInfo()
                
                print(userInfo.readUserInfo())
                
                }, failure: { (error) -> () in
                    print("还没有加载到userInfo,继续加载页面")

                    
                })
            
            
            }) { (error) -> () in
                print("还没有加载到token,继续加载页面")
                print(error)
        }
        
        return false
    }
}
