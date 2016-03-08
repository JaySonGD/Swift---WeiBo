//
//  HomeViewController.swift
//  SmallBlog
//
//  Created by czljcb on 16/2/27.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import MJRefresh

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
        //mgr.modalFrame = CGRect(x: 100, y: 60, width: 180, height: 500)
        
        mgr.finished = {[weak self](isSelected : Bool) -> () in
            
            self!.titleBtn.selected = isSelected
        }
        
        return mgr
    }()
    
    lazy var statuses: [StatusDataModel] = [StatusDataModel]()
    
    lazy var tipLable: UILabel = {
        
        let lable = UILabel()
        lable.frame = CGRect(x: 0, y: 4, width: UIScreen.mainScreen().bounds.size.width, height: 40)
        lable.textAlignment = .Center
        lable.font = UIFont.systemFontOfSize(13)
        lable.textColor = UIColor.whiteColor()
        lable.backgroundColor = UIColor.orangeColor()
        lable.alpha = 0

        return lable
        
    }()
    
    // MARK: **************************************************************************************************
    // MARK: - < Life Cylc >
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        visitorV?.rotationAnima()

        guard isLogin else{
            setUpNavItems()
            return
        }
        
        addNavItems()
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //loadStatusData()
        navigationController?.navigationBar.insertSubview(tipLable, atIndex: 0)
        
        initRefresh()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "seeBigImage:", name: SeeBigImage, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    // ********************************************************************************************************
    // MARK: - < 自定方法 >
    
    @objc func loadNewStatusData(){
        
        loadStatusData(true)
    }
    @objc func loadMoreStatusData(){
        loadStatusData(!true)
        
    }
    
    
    private func initRefresh(){
        
        
        let refresh =  MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: "loadNewStatusData")
        refresh.addSubview(UISwitch())
        tableView.mj_header = refresh
        tableView.mj_header.beginRefreshing()
        
        
        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: "loadMoreStatusData")
        
    }
    
    
    private func loadStatusData(type: Bool){
        
        
        var since_id: String = "0"
        var max_id: String = "0"
        
        if type{
            since_id = (statuses.first?.status?.idstr) ?? "0"
        }
        else
        {
            max_id = (statuses.last?.status?.idstr) ?? "0"
            
            
            guard (Int(max_id)! - 1 > 0)else{
                return
            }
            max_id = "\(Int(max_id)! - 1)"
        }
        
        let parameters = [
            
            "access_token": (UserInfoModel.shareUserInfoModel.userInfo?.access_token)!,
            "since_id": since_id,
            "max_id": max_id
        ]
        
        NetWorkingTools.shareTool.Request(.GET, urlString: StatusesHomeTimeLineURL, parameters: parameters, success: { (data) -> Void in
            
            let newStatuses = data!["statuses"] as! [[String: AnyObject]]?
            var newStatusModel: [StatusDataModel] = [StatusDataModel]()
            print(data)
            
            for statusDict in newStatuses!{
                
                let status = Status(dict: statusDict)
                newStatusModel.append(StatusDataModel(status: status))
            }
            
            if type {
                self.statuses = newStatusModel + self.statuses
            }
            else{
                self.statuses += newStatusModel
            }
            self.tableView.reloadData()
            
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()
            
            [UIView .animateWithDuration(0.5, animations: { () -> Void in
                self.tipLable.hidden = !true
                if newStatusModel.count > 0 {
                    self.tipLable.text = "加载\(newStatusModel.count)条微薄"
                }
                else{
                    self.tipLable.text = "没有最新微薄"
                }
                self.tipLable.transform = CGAffineTransformMakeTranslation(0, 40)
                self.tipLable.alpha = 1.0
                }, completion: { (isFinished) -> Void in
                    
                    [UIView .animateWithDuration(0.5, delay: 0.5, options: [], animations: { () -> Void in
                        
                        self.tipLable.transform = CGAffineTransformIdentity
                        }, completion: { (isFinished) -> Void in
                            self.tipLable.hidden = true
                            self.tipLable.alpha = 0
                    })]
            })]
            
            }) { (error) -> () in
                self.tableView.mj_header.endRefreshing()
                self.tableView.mj_footer.endRefreshing()
        }
        
    }
    
    private func addNavItems(){
        navigationItem.leftBarButtonItem = UIBarButtonItem.barButtonItem("navigationbar_friendattention", highlightedImageName: "navigationbar_friendattention_highlighted", target: self, action: "")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.barButtonItem("navigationbar_pop", highlightedImageName: "navigationbar_pop_highlighted" ,target: self, action: "")
        
        navigationItem.titleView = titleBtn
        
    }
    
    // ********************************************************************************************************
    // MARK: - < 事件监听 >
    
    @objc private func seeBigImage(noti: NSNotification){
        
        let dict = noti.userInfo as! [String: AnyObject]
        let seeBigVC = SeeBigImageConroller(userInfo: dict)
        presentViewController(seeBigVC, animated:true, completion: nil)
    }
    
    @objc private func titleClick(titleBtn: UIButton){
        
        //        titleBtn.selected = !titleBtn.selected
        
        let popVC = PopoverView()
        //防止背后的视图
        popVC.modalPresentationStyle = .Custom
        popVC.transitioningDelegate = PresentationMgr
        
        presentViewController(popVC, animated: true, completion: nil)
    }
    
    
}


extension HomeViewController{
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return statuses.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("homeCell") as! HomeCell
        cell.status = statuses[indexPath.row]
        
        return cell
    }
    
}

