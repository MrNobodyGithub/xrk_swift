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

class ZMETool :NSObject{
    
    //收藏 取消
    
    static func MeRequestColCancle(params: [String :Any], success:@escaping (_ result: Any) -> (),fail:@escaping(_ error: Error) -> ())  {
         
        ZHTTPTool.requestData(.post, urlString: URL_me_coll_cancle, params: params, success: { (res) in
            let b = BaseResult.deserialize(from: res)
            success(b as Any)
        }, fail: { (err) in
            fail(err)
        },isHiddenHud: true)
        
    }
    //收藏
    static func MeRequestCol(params: [String :Any], success:@escaping (_ result: Any) -> (),fail:@escaping(_ error: Error) -> ())  {
        ZHTTPTool.requestData(.get, urlString: URL_me_coll, params: params, success: { (res) in
            let b = BaseResult.deserialize(from: res)
            if res["datas"] is NSDictionary{
                let json = JSON.init(res)
                let newArr = json["datas"]["favorites_list"].arrayValue
                
                let mutArr = NSMutableArray.init()
                for jj :JSON in newArr{
                    let model : MeModelCol = MeModelCol.deserialize(from: jj.dictionary)!
                    mutArr.add(model)
                }
                b?.array = mutArr.copy() as! NSArray
            }
            success(b ?? BaseResult.init())
        }, fail: { (err) in
            fail(err )
        })
    }
}
