//
//  MeParams.swift
//  XrkSwift
//
//  Created by jason on 2018/3/27.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import UIKit

class MeParamColl: BaseParam {
    var curpage : Int = 0
    var page : Int = 2
    required init(curpage: Int, page: Int) {
        self.curpage = curpage
        self.page = page;
    }
    
    required override init() {
        fatalError("init() has not been implemented")
    }
}
