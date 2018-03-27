//
//  BaseModel.swift
//  XrkSwift
//
//  Created by jason on 2018/1/23.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import HandyJSON


class BaseResult: HandyJSON {
    var code: Int = 0
    var datas: (Any)? = nil
    var array: NSArray = []
    var dict = Dictionary<String, Any>()
    var error : String = ""
    var success:Bool{
        get{
            if code == 200 {
                return true
            }
            return false
        }
    }
    required init() {
        
    }
}

//var dataArrCycle :NSArray{
//    set{
//        _dataArrCycle  = newValue
//        setupViewCycle(arr: newValue)
//    }
//    get {
//        return _dataArrCycle!
//    }
//}

class BaseParam: NSObject, HandyJSON {
    var _key : NSString = ""
    var key : NSString?{
        set{
            _key = newValue as! NSString
        }
        get{
            return "70f26291a79dc1600cfc6a7e4bf98592"
        }
    }
    required  override init() {
         
    }
}


 


