//
//  ZtestView.swift
//  XrkSwift
//
//  Created by CityMedia on 2018/4/18.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import UIKit

class ZTestView: UIView {
    
    typealias swiftBlock = (_ str: String) -> Void
    var callback: swiftBlock!
    //3. 定义一个方法,方法的参数为和swiftBlock类型一致的闭包,并赋值给callBack
    func callBackBlock(block: @escaping (_ str: String) -> Void) {
        callback = block
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialFromXib()
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialFromXib()
     }
    func initialFromXib()  { 
        let v = Bundle.main.loadNibNamed("ZTestView", owner: self, options: nil)?.last as! UIView
         v.frame = bounds
        self.addSubview(v)
    }
    
}
