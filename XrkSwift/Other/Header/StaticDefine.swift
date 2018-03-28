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
let MESSAGE_network_fail = "网络不佳"

let Key_AFNetworkStatus = "AFNetworkReachabilityStatus"

func iphone5() -> Bool{
    return verifyIphone(w: 320.0, h: 568.0)
}
func iphone6() -> Bool{
    return verifyIphone(w: 375.0, h: 667.0)
}
func iphone6p() -> Bool{
    return verifyIphone(w: 414.0, h: 736.0)
}
func iphoneX() -> Bool{
    return verifyIphone(w: 375.0, h: 812.0)
}
func verifyIphone(w: CGFloat,h :CGFloat) -> Bool{
    if MLScreenWidth == w && MLScreenHeight == h || MLScreenHeight == w && MLScreenWidth == h {
        return true
    }else{
        return false
    }
}

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
    return UIColor.init(red:getArc() , green: getArc(), blue: getArc(), alpha: 0.4)
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
func ZtoString<A> (_ a: inout A) -> String{
    return String(describing: a)
}

func zswap<T> (_ a: inout T, _ b :inout T){
    let str = String(describing: a) + "  " + String(describing: b)
    let tem = a
    a = b
    b = tem
    let stra = str + "->" + String(describing: a) + "  " + String(describing: b)
    print(stra)
}

