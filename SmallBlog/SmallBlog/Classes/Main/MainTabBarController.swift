//
//  MainTabBarController.swift
//  SmallBlog
//
//  Created by czljcb on 16/2/27.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    // MARK: - 属性
    let itemsInfo = ["tabbar_home","tabbar_message_center","","tabbar_discover","tabbar_profile"]
    
    
    // ********************************************************************************************************
    // MARK: - < 系统方法 >
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //
        //        let homeVC = HomeViewController()
        //        addChildViewController(homeVC,imageName: "tabbar_home",title: "首页")
        //
        //        let messageVC = MessageViewController()
        //        addChildViewController(messageVC,imageName: "tabbar_message_center",title: "消息")
        //
        //        let discoverVC = DiscoverViewController()
        //        addChildViewController(discoverVC,imageName: "tabbar_discover",title: "发现")
        //
        //        let profileVC = ProfileViewController()
        //        addChildViewController(profileVC,imageName: "tabbar_profile",title: "我的")
        
        //        let btn = UIButton(type: .Custom)
        //        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button" ), forState: .Normal)
        //        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button_highlighted" ), forState: .Highlighted)
        //
        //        btn.setImage(UIImage(named:"tabbar_compose_icon_add" ), forState: .Normal)
        //        btn.setImage(UIImage(named:"tabbar_compose_icon_add_highlighted" ), forState: .Highlighted)
        //
        //        btn.sizeToFit()
        
        //        let btn = UIButton.createButton("tabbar_compose_icon_add", backroundImage: "tabbar_compose_button")
        let btn = UIButton(image: "tabbar_compose_icon_add", backroundImage: "tabbar_compose_button")
        btn.center = CGPoint(x: tabBar.center.x, y: tabBar.frame.size.height * 0.5)
        btn.addTarget(self, action: Selector("composeClick"), forControlEvents: .TouchUpInside)
        
        tabBar.addSubview(btn)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        addItems()
    }
    
    // ********************************************************************************************************
    // MARK: - < 事件处理 >
    
    @objc private func composeClick(){
        
        print("000")
    }
    
    
    
    // ********************************************************************************************************
    // MARK: - < 自定义方法 >
    
    private func addItems(){
        
        
        for i in 0..<(tabBar.items?.count)!{
            
            
            let item = tabBar.items![i]
            
            if i == 2{
                item.enabled = !true
                continue
            }
            
            //item.title = title
            item.image = UIImage(named: itemsInfo[i])?.imageWithRenderingMode(.AlwaysOriginal)
            item.selectedImage = UIImage(named:itemsInfo[i] + "_highlighted")?.imageWithRenderingMode(.AlwaysOriginal)
        }
    }
    
    //    private func addChildViewController(childVC: UIViewController ,imageName: String ,title: String)
    //    {
    //        let navVC = MainNavigationController(rootViewController: childVC)
    //        childVC.navigationItem.title = title
    //        navVC.tabBarItem.title = title
    //        navVC.tabBarItem.image = UIImage(named:imageName )?.imageWithRenderingMode(.AlwaysOriginal)
    //        navVC.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")?.imageWithRenderingMode(.AlwaysOriginal)
    //        addChildViewController(navVC)
    //    }
    


}
