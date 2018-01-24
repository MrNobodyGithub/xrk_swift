//
//  HomeRecModel.swift
//  XrkSwift
//
//  Created by jason on 2017/9/8.
//  Copyright © 2017年 HuaZhengInfo. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomeModelList {
    var store_id: String
    var store_name: String
    init(json:JSON) {
        store_id = json["store_id"].stringValue
        store_name = json["store_name"].stringValue
    }
}

