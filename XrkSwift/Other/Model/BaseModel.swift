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


class BaseParam: NSObject, HandyJSON {
    var key : String{
        set{
            self.key = newValue
        }
        get{
            return ""
        }
    }
    required override init() {
         
    }
}


 


