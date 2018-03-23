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
 
//
//#define MLStatusBarHeight     [[UIApplication sharedApplication] statusBarFrame].size.height
//
//#define MLNavigationBarHeight self.navigationController.navigationBar.frame.size.height
//// tableBar的高度
//#define MLTabBarHeight self.tabBarController.tabBar.frame.size.height

func RGBColor(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor{
    return UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
}
func RGB_arc_Color() -> UIColor{ 
//    let tempa = Int(arc4random()%100)+1
//    let temp = Int(arc4random_uniform(100))+1
    let number =  CGFloat(arc4random() % 255)
    let rgb = number / 255
    return UIColor.init(red:rgb , green: rgb, blue: rgb, alpha: 0.4)
}
