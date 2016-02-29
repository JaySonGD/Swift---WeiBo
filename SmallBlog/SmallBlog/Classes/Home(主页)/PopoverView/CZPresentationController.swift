//
//  CZPresentationController.swift
//  SmallBlog
//
//  Created by czljcb on 16/2/28.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class CZPresentationController: UIPresentationController {
    
    // MARK: - 属性
    var modalFrame = CGRect(x:(UIScreen.mainScreen().bounds.size.width - 200)*0.5, y: 60, width: 200, height: 350)

    // MARK: - 系统会掉函数
    
//    override func containerViewDidLayoutSubviews() {
//    }
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        presentedView()?.frame = modalFrame
        
        
        let dimissView = UIView(frame:(containerView?.bounds)!)
        dimissView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "dismiss"))
        dimissView.backgroundColor = UIColor(white: 0.2, alpha: 0.001)
        containerView?.insertSubview(dimissView, belowSubview: presentedView()!)
    }
    
    // MARK: - 事件监听
    
    @objc private func dismiss(){
        
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
        
    }
}
