//
//  ZShowHUD.swift
//  XrkSwift
//
//  Created by jason on 2018/3/15.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import Foundation
import UIKit

class ZHUD: NSObject {
    func hudSuccess(curView:UIView  )  {
        var view = curView
        if view == nil {
            view = UIApplication.shared.windows.last!
        }
//        let hud =  MBProgressHUD()
    
        
//        if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
//        // 快速显示一个提示信息
//        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//        hud.labelText = text;
//        // 设置图片
//        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
//        // 再设置模式
//        hud.mode = MBProgressHUDModeCustomView;
//
//        // 隐藏时候从父控件中移除
//        hud.removeFromSuperViewOnHide = YES;
//
//        // 1秒之后再消失
//        [hud hide:YES afterDelay:1.5];
        
        
    }
}
