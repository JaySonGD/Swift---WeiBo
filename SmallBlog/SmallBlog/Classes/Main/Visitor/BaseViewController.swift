//
//  BaseViewController.swift
//  SmallBlog
//
//  Created by czljcb on 16/2/27.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {

    // MARK: - 属性
    var isLogin = !true
    
    var visitorV : VisitorView?
    
    // ********************************************************************************************************
    // MARK: - < 系统函数 >
    
    override func loadView() {
        isLogin ? super.loadView() : visitorView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // ********************************************************************************************************
    // MARK: - < 自定方法 >
    func visitorView(){
        
        view = VisitorView.visitorView()
        visitorV = view as? VisitorView
        
        visitorV?.loginBtn .addTarget(self, action: "loginClick", forControlEvents: .TouchUpInside)
        visitorV?.registerBtn.addTarget(self, action: "loginClick", forControlEvents: .TouchUpInside)
    }
    
    func setUpNavItems()
    {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .Done, target: self, action: "registerClick")

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .Done, target: self, action: "loginClick")
    }
    
    // ********************************************************************************************************
    // MARK: - < 事件监听 >
    
    @objc private func loginClick(){
        print(__FUNCTION__)
        
        let NavVC = MainNavigationController(rootViewController: Oauth2ViewController())
        presentViewController(NavVC, animated: true, completion: nil)
        
        

    }

    
    @objc private func registerClick(){
        print(__FUNCTION__)
    }


}
