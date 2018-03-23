//
//  ZMeTool.swift
//  XrkSwift
//
//  Created by jason on 2018/1/24.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit

class ZMETool { 
    static func meRequest(params:[String: Any]? = nil, success:@escaping(_ result : Any) -> ()) {
        ZHTTPTool.requestData(.post, urlString: URL_me, params: params, success: { (res) in
            
//            let result = BaseResult.init(json: res as! JSON)
            
//            success(result)
        }) { ( res) in
            
        } 
    }
}
