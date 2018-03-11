//
//  ZHomeModel.swift
//  XrkSwift
//
//  Created by shmily on 2018/3/11.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import Foundation
import SwiftyJSON

class HomeModelOne: NSObject {
//    &area_id=224&curpage=0&page=10
    var area_id :String
    var curpage: String
    var page : String
    
    required init(area_id:String) {
        self.area_id = area_id
        self.curpage = "0"
        self.page = "10"
    }
}
