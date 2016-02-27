//
//  MainTabBarController.swift
//  SmallBlog
//
//  Created by czljcb on 16/2/27.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let homeVC = HomeViewController()
        addChildViewController(homeVC,imageName: "tabbar_home",title: "首页")
        
        let messageVC = MessageViewController()
        addChildViewController(messageVC,imageName: "tabbar_message_center",title: "消息")

        let discoverVC = DiscoverViewController()
        addChildViewController(discoverVC,imageName: "tabbar_discover",title: "发现")

        let profileVC = ProfileViewController()
        addChildViewController(profileVC,imageName: "tabbar_profile",title: "我的")


        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // ********************************************************************************************************
    // MARK: - < addChildViewController >
    
    private func addChildViewController(childVC: UIViewController ,imageName: String ,title: String)
    {
        let navVC = MainNavigationController(rootViewController: childVC)
        childVC.navigationItem.title = title
        navVC.tabBarItem.title = title
        navVC.tabBarItem.image = UIImage(named:imageName )?.imageWithRenderingMode(.AlwaysOriginal)
        navVC.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")?.imageWithRenderingMode(.AlwaysOriginal)
        addChildViewController(navVC)
    }
    


}
