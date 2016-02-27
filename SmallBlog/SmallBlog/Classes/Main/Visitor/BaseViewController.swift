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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
    }


}
