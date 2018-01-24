//
//  ZCommonTool.swift
//  XrkSwift
//
//  Created by jason on 2018/1/24.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import Foundation
import UIKit

class ZCommonTool {
    
    static func alertWithDetail(detail: String ) {
        let alert =  UIAlertView.init(title: "remind", message: detail, delegate: nil, cancelButtonTitle: "cancle")
        alert.show()
}
    
}
