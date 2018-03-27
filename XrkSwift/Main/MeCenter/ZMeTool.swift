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
    //收藏
    static func homeRequestCycle(params: AnyObject? = nil, success:@escaping (_ result: Any) -> (),fail:@escaping(_ error: NSError) -> ())  {
//        RequestTool.defaultTool.request(method: .get, urlString: URL_home_cycle, parameters: params, resultBlock: { (res) in
    
    }
    //test
    static func meRequest(params:[String: Any]? = nil, success:@escaping(_ result : Any) -> ()) {
        ZHTTPTool.requestData(.post, urlString: URL_me, params: params, success: { (res) in
             
        }) { ( res) in
            
        } 
    }
}
