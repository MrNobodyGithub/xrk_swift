//
//  ZBtn.swift
//  XrkSwift
//
//  Created by jason on 2018/3/23.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import Foundation
import UIKit
 
//typedef NS_ENUM(NSInteger, ZButtonType) {
//
//    UIButtonTypeCustom = 0,                         // no button type
//    UIButtonTypeSystem NS_ENUM_AVAILABLE_IOS(7_0)
//
//};
enum ZBtnType {
    case home
}
let atest = ""
class ZButton: UIButton {
    
//    var btnType : ZBtnType = ZBtnType.home
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageView?.contentMode = UIViewContentMode.scaleAspectFit
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let labH :  CGFloat = 30.0
    let imageH: CGFloat = 70
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let rect = CGRect.init(x: 0, y: self.frame.size.height - labH, width: self.frame.size.width, height: labH)
        return rect
    }
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let rect = CGRect.init(x: 0.cgfloat(), y: 10.cgfloat(), width: self.frame.size.width, height: imageH-20)
        return rect
    }
    
}
