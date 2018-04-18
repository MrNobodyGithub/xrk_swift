//
//  Extension.swift
//  XrkSwift
//
//  Created by jason on 2018/3/23.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD
extension Int{
    func string() -> String {
         return String(self)
    }
    func cgfloat() -> CGFloat {
         return CGFloat(self)
    }
}
extension UIView{
    class func instanteFormNib<T: UIView>() -> T {
        let name = String(describing: T.self)
        let view = UINib(nibName: name, bundle: nil).instantiate(withOwner: nil, options: nil).last
        return view as! T
    }
    
    func zsetX(x:CGFloat){
        self.frame.origin = CGPoint.init(x: x, y: self.frame.origin.y)
    }
    func zx() -> CFloat {
        return CFloat(self.frame.origin.x)
    }
    
    func zy() -> CFloat {
        return CFloat(self.frame.origin.y)
    }
    
    func zw() -> CFloat {
        return CFloat(self.frame.size.width)
    }
    
    func zh() -> CFloat {
        return CFloat(self.frame.size.height)
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


extension UIViewController{
    func zNavLeftBarButtonItem(target: Any, action: Selector? = nil) {
        let btn = UIButton.init(type: .custom)
        btn.setImage(UIImage.init(named: "back_b"), for: .normal);
        btn.frame = CGRect.init(x: 0, y: 0, width: 60, height: 44)
        btn.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        btn.addTarget(target, action: action ?? #selector(z_back), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: btn)
    }
    
    func z_back(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func getCurrentViewCon() -> UIViewController {
        let vc = UIApplication.shared.keyWindow?.rootViewController
        return getCurrentVCFrom(rootVC: vc!)
    }
    func getCurrentVCFrom(rootVC : UIViewController) -> UIViewController {
        let curVC : UIViewController
        if (rootVC.presentedViewController != nil) {
            curVC = rootVC.presentedViewController!
        }else if rootVC.isKind(of: UITabBarController.self){
            let rvc = rootVC as! UITabBarController
//            curVC = rvc.selectedViewController!
            curVC = getCurrentVCFrom(rootVC: rvc.selectedViewController!)
        }else if rootVC.isKind(of: UINavigationController.self){
            let nvc = rootVC as! UINavigationController
//            curVC = nvc.visibleViewController!
            curVC = getCurrentVCFrom(rootVC: nvc.visibleViewController!)
        }else{
            curVC = rootVC
        }
        return curVC
    }
    
}
