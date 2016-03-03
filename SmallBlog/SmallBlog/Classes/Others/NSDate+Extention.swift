//
//  NSDate+Extention.swift
//  SmallBlog
//
//  Created by czljcb on 16/3/2.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit


extension NSDate {
    
    
     func stringWithDate() -> String {
        
        let Sceconds =    Int(NSDate().timeIntervalSinceDate(self))

        
        if Sceconds < 60  {
            return "刚刚"
        }
        
        if Sceconds < 60 * 60 {
            return "\(Sceconds/60)分钟前"
        }
        
        if Sceconds < 60*60 * 24{
            return "\(Sceconds/3600)小时前"
        }
        
        let fmt = NSDateFormatter()
        
        if  NSCalendar.currentCalendar().components(.Year, fromDate: self, toDate: NSDate(), options: []).year >= 1 {
            fmt.dateFormat = "yyyy-MM-dd HH:mm:SS"
            
            print(  NSCalendar.currentCalendar().components(.Year, fromDate: self).year )
            return fmt.stringFromDate(self)
        }

        if  NSCalendar.currentCalendar().components(.Day, fromDate: self, toDate: NSDate(), options: []).day > 1 {
            fmt.dateFormat = "MM-dd HH:mm:SS"
            return fmt.stringFromDate(self)
        }
        
        if  NSCalendar.currentCalendar().components(.Day, fromDate: self, toDate: NSDate(), options: []).day == 1 {
            
            fmt.dateFormat = "HH:mm:SS"
            return "咋天 \(fmt.stringFromDate(self))"
        }
        
        return ""
    }
    
    
}