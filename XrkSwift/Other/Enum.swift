//
//  Enum.swift
//  XrkSwift
//
//  Created by CityMedia on 2018/9/14.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import Foundation

enum CusTYPE {
    case left
    case right
    enum UP {
        case up_a
        case up_b
    }
}
enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
enum CompassPoint: String {
    case North, South, East, West
}

class A: NSObject {
    func test()  {
        CusTYPE.UP.up_a
        
    }
}
