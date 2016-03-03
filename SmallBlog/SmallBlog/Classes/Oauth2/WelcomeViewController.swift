//
//  WelcomeViewController.swift
//  SmallBlog
//
//  Created by czljcb on 16/3/1.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import SDWebImage

class WelcomeViewController: UIViewController {

    // MARK: - 属性
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var textLable: UILabel!
    /// 约束的底部
    @IBOutlet weak var iconViewB: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        textLable.text = "欢迎\(UserInfoModel.shareUserInfoModel.userInfo?.screen_name ?? "")回来"
        iconView.sd_setImageWithURL(UserInfoModel.shareUserInfoModel.profileImageUrl!)
        
        iconViewB.constant = 500
        
        [UIView .animateWithDuration(2.0, delay: 0, usingSpringWithDamping: 0.4,
            initialSpringVelocity: 0.1, options: [], animations: { () -> Void in
            
            self.view.layoutIfNeeded()
            }, completion: { (isFinished) -> Void in
            
                UIApplication.sharedApplication().keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        })]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
