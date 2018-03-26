//
//  HomeHeaderView.swift
//  XrkSwift
//
//  Created by jason on 2018/3/23.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import Foundation
import UIKit

class HomeHeaderView: UIView {
    override init(frame:CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var _dataArr: NSArray?
    
    var dataArr:NSArray?{
//        willset{
//
//        }
//        didset{
//
//        }
        set{
            _dataArr = newValue
            setupViews(arr: dataArr!)
        }
        get{
            return _dataArr
        }
    }
    
    func setupViews(arr: NSArray)  {
        
         for i: Int in 0...arr.count-2 {
            let model: HomeModelCategory = arr[i] as! HomeModelCategory
            let btnW:CGFloat = MLScreenWidth/5.0;
            let btnH:CGFloat = 100.0;
            var btnX:CGFloat = 0;
            var btnY:CGFloat = 0;
            
            btnX = (i % 5 ).cgfloat() * btnW
            btnY = (i/5).cgfloat() * btnH
            
            let btn :ZButton = ZButton.init(frame:CGRect.init(x: btnX, y: btnY, width: btnW, height: CGFloat(btnH)))
            
            btn.imageView?.sd_setImage(with: URL.init(string: model.cn_pic), completed: { (image, err, Type, ur) in

                btn.setImage(image, for: .normal)
            })
             self.addSubview(btn)
            btn.setTitle(model.gc_name, for: UIControlState.normal)

            btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            btn.setTitleColor(UIColor.black, for: UIControlState.normal)
            btn.titleLabel?.textAlignment = NSTextAlignment.center
            
//            btn.imageView?.image = UIImage.init(named: "default");
////            btn.imageView?.sd_setImage(with: URL.init(string: model.cn_pic))
//            btn.imageView?.backgroundColor = UIColor.green
        }
        
        
        
    }
    
    
}
