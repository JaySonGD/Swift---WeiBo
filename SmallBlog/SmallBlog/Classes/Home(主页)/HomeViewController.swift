//
//  HomeViewController.swift
//  SmallBlog
//
//  Created by czljcb on 16/2/27.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: - 属性
    lazy var titleBtn: TitleButton = {
       
        let titleBtn = TitleButton(type: .Custom)
        titleBtn.setTitle("JaySonGD", forState: .Normal)
        titleBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        titleBtn.setImage(UIImage(named: "navigationbar_arrow_down"), forState: .Normal)
        titleBtn.setImage(UIImage(named: "navigationbar_arrow_up"), forState: .Selected)
        titleBtn.addTarget(self, action: "titleClick:", forControlEvents: .TouchDown)
        titleBtn.sizeToFit()
        return titleBtn
    }()
    
    lazy var PresentationMgr: PresentationManager = {
        
        let mgr = PresentationManager()
//        mgr.modalFrame = CGRect(x: 100, y: 60, width: 180, height: 500)
        
        mgr.finished = {[weak self](isSelected : Bool) -> () in
            
            self!.titleBtn.selected = isSelected
        }

        return mgr
    }()
    
    // MARK: **************************************************************************************************
    // MARK: - < Life Cylc >
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        visitorV?.rotationAnima()
        
        
        
        guard isLogin else{
            setUpNavItems()
            return
        }
        
        addNavItems()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ********************************************************************************************************
    // MARK: - < 自定方法 >
    
    private func addNavItems(){
        navigationItem.leftBarButtonItem = UIBarButtonItem.barButtonItem("navigationbar_friendattention", highlightedImageName: "navigationbar_friendattention_highlighted", target: self, action: "")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.barButtonItem("navigationbar_pop", highlightedImageName: "navigationbar_pop_highlighted" ,target: self, action: "")
        
 
        navigationItem.titleView = titleBtn
        
    }
    
    // ********************************************************************************************************
    // MARK: - < 事件监听 >
    
    @objc private func titleClick(titleBtn: UIButton){
        
//        titleBtn.selected = !titleBtn.selected
        print(__FUNCTION__)
        
        let popVC = PopoverView()
        //防止背后的视图
        popVC.modalPresentationStyle = .Custom
        popVC.transitioningDelegate = PresentationMgr
        
        presentViewController(popVC, animated: true, completion: nil)
    }
    
    
}

