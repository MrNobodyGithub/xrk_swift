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
import AFNetworking
enum MethodType {
    case get
    case post
}

class RequestTool : AFHTTPSessionManager{
    
    static let defaultTool : RequestTool = {
        let tools = RequestTool()
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        tools.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return tools
    }()
    
    
    
    func request(method: MethodType , urlString: String, parameters: AnyObject?,resultBlock : @escaping([String : Any]?, Error?) -> ()){
        // 定义一个请求成功之后要执行的闭包
        // 成功闭包
        let successBlock = { (task: URLSessionDataTask, responseObj: Any?) in
            resultBlock(responseObj as? [String : Any], nil)
        }
        
        // 失败的闭包
        let failureBlock = { (task: URLSessionDataTask?, error: Error) in
            resultBlock(nil, error)
        }
         
        // Get 请求
        if method == .get {
            get(urlString, parameters: parameters, progress: nil, success: successBlock, failure: failureBlock)
        }
        // Post 请求
        if method == .post {
            post(urlString, parameters: parameters, progress: nil, success: successBlock, failure: failureBlock)
        }
        
    }
    
}



class ZHTTPTool{
    
    class func requestData(_ type:MethodType, urlString:String ,params: [String : Any]? = nil, success:@escaping(_ result : Any) -> (), fail:@escaping(_ result : Any) -> ()) {
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(urlString, method: method, parameters: params).responseJSON { (response) in
            
            let result = response.result.value 
            let json = JSON(result ?? [])
             success(json)
        }
    }
}

