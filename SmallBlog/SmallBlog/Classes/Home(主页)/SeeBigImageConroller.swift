//
//  SeeBigImageConroller.swift
//  SmallBlog
//
//  Created by czljcb on 16/3/4.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import SnapKit

let CellID = "CellID"

class SeeBigImageConroller: UIViewController {

    // MARK: - 属性
    lazy var closeBtn: UIButton = {
       
        let btn = UIButton(type: UIButtonType.Custom)
        btn.setTitle("关闭", forState: .Normal)
        btn.tintColor = UIColor.whiteColor()
        btn.backgroundColor = UIColor.lightGrayColor()
        btn.titleLabel?.font = UIFont.systemFontOfSize(15)
        
        return btn
    }()
    
    lazy var saveBtn: UIButton = {
        
        let btn = UIButton(type: UIButtonType.Custom)
        btn.setTitle("保存", forState: .Normal)
        btn.tintColor = UIColor.whiteColor()
        btn.backgroundColor = UIColor.lightGrayColor()
        btn.titleLabel?.font = UIFont.systemFontOfSize(15)

        return btn
    }()
    
    lazy var collectionView: UICollectionView = {
        
        let latOut = UICollectionViewFlowLayout()
        latOut.itemSize = CGSize(width: iPhoneW, height: iPhoneH)
        latOut.scrollDirection = .Horizontal
        latOut.minimumInteritemSpacing = 0
        latOut.minimumLineSpacing = 0
        
        let phototView = UICollectionView(frame: CGRectZero, collectionViewLayout: latOut)
        phototView.pagingEnabled = true
        phototView.showsHorizontalScrollIndicator = !true
        
        return phototView
    }()
    
    var indexPath: NSIndexPath?
    var urls: [NSURL]?
    
    // ********************************************************************************************************
    // MARK: - < 系统回调方法 >
    
    init(userInfo: [String: AnyObject]?){
        super.init(nibName: nil, bundle: nil)
        indexPath = userInfo!["IndexPathKey"] as? NSIndexPath
        urls = userInfo!["PicURLsKey"] as? [NSURL]
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initUI()
        view.backgroundColor = UIColor.whiteColor()
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ********************************************************************************************************
    // MARK: - < 自定方法 >
    
    private func initUI(){
        
        // MARK: - UICollecton
        view.addSubview(collectionView)
        
        collectionView.frame = CGRect(x: 0, y: 0, width: iPhoneW, height: iPhoneH)
        collectionView.dataSource = self
        collectionView.registerClass(SeeBigImageCell.self, forCellWithReuseIdentifier: CellID)
        
        
        // MARK: - Button
        view.addSubview(closeBtn)
        view.addSubview(saveBtn)
        
        closeBtn.snp_makeConstraints { (make) -> Void in

            make.left.equalTo(view).offset(10)
            make.bottom.equalTo(view).offset(-10)
            make.size.equalTo(CGSize(width: 75, height: 30))
        }
        
        saveBtn.snp_makeConstraints { (make) -> Void in
            
            make.right.equalTo(view).offset(-10)
            make.bottom.equalTo(view).offset(-10)
            make.size.equalTo(CGSize(width: 75, height: 30))
        }

        closeBtn.addTarget(self, action: "closeButtonClick", forControlEvents: .TouchUpInside)
        saveBtn.addTarget(self, action: "saveButtonClick", forControlEvents: .TouchUpInside)


        
    }
    
    // ********************************************************************************************************
    // MARK: - < 事件监听 >
    
    @objc private func closeButtonClick(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @objc private func saveButtonClick(){
        
    }


}


// ********************************************************************************************************
// MARK: - < UICollectionViewDataSource >

extension SeeBigImageConroller: UICollectionViewDataSource{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urls?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CellID, forIndexPath: indexPath) as! SeeBigImageCell
        
        cell.imageUrl = urls![indexPath.row]
        return cell
    }
}

