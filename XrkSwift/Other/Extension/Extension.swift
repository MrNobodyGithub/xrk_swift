//
//  Extension.swift
//  XrkSwift
//
//  Created by jason on 2018/3/23.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import Foundation
import UIKit

extension Int{
    func string() -> String {
         return String(self)
    }
    func cgfloat() -> CGFloat {
         return CGFloat(self)
    }
}
extension UIView{
    func zsetX(x:CGFloat){
        self.frame.origin = CGPoint.init(x: x, y: self.frame.origin.y)
    }
    func zx() -> CFloat {
        return CFloat(self.frame.origin.x)
    }
    
    func zy() -> CFloat {
        return CFloat(self.frame.origin.y)
    }
    
    func zw() -> CFloat {
        return CFloat(self.frame.size.width)
    }
    
    func zh() -> CFloat {
        return CFloat(self.frame.size.height)
    }
}

