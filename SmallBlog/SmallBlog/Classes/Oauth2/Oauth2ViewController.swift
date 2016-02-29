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
        
        let jsCode = "document.getElementById('userId').value='13760004725';document.getElementById('passwd').value='czljcb';"
        loginView.stringByEvaluatingJavaScriptFromString(jsCode)
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
        
        print(code)
        print(request.URL?.absoluteString)
        NetWorkingTools.getAccessToken(code, success: { (data) -> Void in
            
            print(data)
            
            }) { (error) -> () in
                print(error)
        }

        return false
    }
}
