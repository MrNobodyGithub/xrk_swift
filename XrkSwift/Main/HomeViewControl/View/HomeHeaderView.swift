//
//  HomeHeaderView.swift
//  XrkSwift
//
//  Created by jason on 2018/3/23.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import Foundation
import UIKit

protocol HomeHeaderViewDelegate {
//    var model : HomeModelCategory {get set}

      func clickCategory(model: HomeModelCategory)
}


class HomeHeaderView: UIView{
    override init(frame:CGRect){
        super.init(frame: frame)
    }
    
     var delegate : HomeHeaderViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let objc_key_btn_homecategory = "objc_key_btn_homecategory"
    var _dataArrCategory: NSArray?
    
    var dataArrCategory:NSArray?{
//        willset{
//
//        }
//        didset{
//
//        }
        set{
            _dataArrCategory = newValue
            setupViews(arr: dataArrCategory!)
        }
        get{
            return _dataArrCategory
        }
    }
    
    func btnAction(btn:UIButton){
//        let model : HomeModelCategory = objc_getAssociatedObject(btn, objc_key_btn_homecategory) as! HomeModelCategory
        let model: HomeModelCategory = self.dataArrCategory![btn.tag - 10] as! HomeModelCategory
        if self.delegate != nil {
             self.delegate?.clickCategory(model: model)
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
            
//            objc_setAssociatedObject(btn, objc_key_btn_homecategory, model, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            btn.tag = 10 + i
            btn.addTarget(self, action: #selector(btnAction(btn:)), for: .touchUpInside)
            
        }
        
    }
    
    
}
