//
//  ZShowHUD.swift
//  XrkSwift
//
//  Created by jason on 2018/3/15.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

class ZShowHud: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    } 
    
    class func show(view: UIView!){
        
        let v = ZShowHud.init(frame: view.bounds)
        view.addSubview(v)
//        v.backgroundColor = UIColor.red
        let activity = UIActivityIndicatorView.init()
        activity.frame.size = CGSize.init(width: 40, height: 40)
        activity.center = view.center
        v.backgroundColor = RGBAColor(r: 0, g: 0, b: 0, a: 0.618)
        v.addSubview(activity)
        activity.activityIndicatorViewStyle = .whiteLarge
        activity.startAnimating()
    }
    class func hide(view: UIView!){
        for v in view.subviews {
            if v.isKind(of: self){
                v.removeFromSuperview()
            }
        }
        
    }
    
    
    
    
    
}

extension MBProgressHUD{
    // 命名规范 hud+展示or隐藏+
    
    //展示 成功失败 图片 以及 动态提示文案
    class func hudShowSuccess(curview: UIView?, text: String)   {
         self.hudShowWith(curview: curview, text: text, imageName: "success")
    }
    class func hudShowFail(curview: UIView?, text: String)   {
         self.hudShowWith(curview: curview, text: text, imageName: "fail")
    }
    class func hudShowWith(curview: UIView?, text: String, imageName: String) {
        var view = UIView.init()
        if curview == nil{
            view = UIApplication.shared.windows.last!
        }else{
            view = curview!
        }
        // 快速显示一个提示信息
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = text
        //        // 设置图片
        hud.customView = UIImageView.init(image: UIImage.init(named: imageName))
        //        // 再设置模式
        hud.mode = MBProgressHUDMode.customView
        //        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = true;
        hud.hide(animated: true, afterDelay: 2)
    }

     //展示 loding 以及 文案
    class func hudShowMessage(curview: UIView?, message: String)  {
        var view = UIView.init()
        if curview == nil{
            view = UIApplication.shared.windows.last!
        }else{
            view = curview!
        }
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = message
        hud.removeFromSuperViewOnHide = true;
        hud.dimBackground = true
//        return hud
    }
    class func hudHid(curview: UIView! ){
        self.hide(for: curview, animated: true)
    }
  
    // 快速 展示 关闭
    class func zshow(view: UIView?){ 
        self.showAdded(to: view!, animated: true);
    }
    class func zhide(view: UIView?){
        self.hide(for: view!, animated: true)
    }
}


