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

 

enum Header {
    case home
    case two
    enum three {
        case three_a
        case three_b
        enum threeEnum {
            case thr_a_a
        }
    }
    
    
    enum Weight: Int {
        case Light = 1
    }
    enum Armor: Int {
        case Light = 2
    }
    
    
    
    
    //0 属性
    var testProperty : String {
        switch self {
        case .home:
            return "homebb"
        case .two:
            return "twobb"
        }
    }
    
    // 1 方法
    func attributes() -> String {
        switch self {
        case .home:
            return "homea"
            //        case .two:
        //            return "two a"
        default :
            return ""
        }
        
    }
    // 静态方法
    enum Device {
        case AppleWatch
        static func fromSlang(term: String) -> Device? {
            if term == "iWatch" {
                return .AppleWatch
            }
            return nil
        }
    }
    
    // 可变方法
    enum TriStateSwitch {
        case Off, Low, High
        mutating func next() {
            switch self {
            case .Off:
                self = .Low
            case .Low:
                self = .High
            case .High:
                self = .Off
            }
        }
    }
    //    var ovenLight = TriStateSwitch.Low
    //    ovenLight.next()
    //    // ovenLight 现在等于.On
    //    ovenLight.next()
    
    
    
    
}

