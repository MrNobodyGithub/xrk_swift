//
//  ZHttpTool.swift
//  XrkSwift
//
//  Created by jason on 2017/9/8.
//  Copyright © 2017年 HuaZhengInfo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
enum MethodType {
    case get
    case post
}

class ZHTTPTool{
    class func requestData(_ type:MethodType, urlString:String ,params: [String : Any]? = nil, success:@escaping(_ result : Any) -> (), fail:@escaping(_ result : Any) -> ()) {
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(urlString, method: method, parameters: params).responseJSON { (response) in
            print(response)
            let result = response.result.value 
            let json = JSON(result ?? [])
            JSON.init(rawValue: result)
             success(json)
//            success(JSON.init(result ?? "a"))
        }
    }
}

