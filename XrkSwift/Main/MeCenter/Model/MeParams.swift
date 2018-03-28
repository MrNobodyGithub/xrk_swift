//
//  MeParams.swift
//  XrkSwift
//
//  Created by jason on 2018/3/27.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import UIKit

class MeParamColl: BasePage {
}

class MeParamCollCancle: BaseParam {
    var fav_id : String
    required init(favid: String) {
        self.fav_id = favid
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
}

