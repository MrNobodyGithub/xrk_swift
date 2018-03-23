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
            print("--%@--",_dataArr)
            setupViews(arr: dataArr!)
        }
        get{
            return _dataArr
        }
    }
    
    func setupViews(arr: NSArray)  {
       
         for i: Int in 0...10 {
            let btnW:CGFloat = MLScreenWidth/5.0;
            let btnH:CGFloat = 40.0;
            var btnX:CGFloat = 0;
            var btnY:CGFloat = 0;
            
            btnX = (i % 5 ).cgfloat() * btnW
            btnY = (i/5).cgfloat() * btnH
            let btn = UIButton.init(frame:CGRect.init(x: btnX, y: btnY, width: btnW, height: CGFloat(btnH)))
             self.addSubview(btn)
            btn.setTitle(i.string(), for: UIControlState.normal)
            btn.backgroundColor = UIColor.gray
        }
        
        
        
    }
    
    
}
