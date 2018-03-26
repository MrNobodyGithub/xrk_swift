//
//  StaticDefine.swift
//  XrkSwift
//
//  Created by jason on 2018/1/24.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import Foundation
import UIKit

let MLScreenWidth = UIScreen.main.bounds.size.width
let MLScreenHeight  = UIScreen.main.bounds.size.height
 


// mbprogresshud  提示文案
let MESSAGE_newwork_fail = "网络不佳"


func RGBColor(r:CGFloat, g:CGFloat, b:CGFloat ) -> UIColor{
    
    return UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
}
func RGBAColor(r:CGFloat, g:CGFloat, b:CGFloat ,a:CGFloat) -> UIColor{
    
    return UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: a)
}
func RGB_arc_Color() -> UIColor{
//    [0,100)包括0，不包括100
//    let tempa = Int(arc4random()%100)
//    let temp = Int(arc4random_uniform(100))+1
    let rgb = getArc()
    return UIColor.init(red:rgb , green: rgb, blue: rgb, alpha: 0.4)
}
func getArc() -> CGFloat{
    return CGFloat(arc4random_uniform(255) + 1) / 255.0
//    return CGFloat(arc4random() % 255) / 255.0
}

func swapTwoValues<T>(_ a: inout T, _ b: inout T){
    let temporaryA = a
    a = b
    b = temporaryA
}

