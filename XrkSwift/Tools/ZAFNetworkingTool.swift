//
//  ZAFNetworkingTool.swift
//  XrkSwift
//
//  Created by shmily on 2018/3/11.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import Foundation

import SwiftyJSON
import AFNetworking
 
class RequestTool : AFHTTPSessionManager{
    
    static let defaultTool : RequestTool = {
        let tools = RequestTool()
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        tools.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return tools
    }()
    
    func request(method: MethodType , urlString: String, parameters: AnyObject?,resultBlock : @escaping([String : Any]?) -> (),failBlock:@escaping(NSError?) -> ()){
        // 定义一个请求成功之后要执行的闭包
        // 成功闭包
        let successBlock = { (task: URLSessionDataTask, responseObj: Any?) in
            resultBlock(responseObj as? [String : Any])
        }
        
        // 失败的闭包
        let failureBlock = { (task: URLSessionDataTask?, error: Error) in
//            resultBlock(nil, error)
            failBlock(error as NSError)
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
