//
//  ZBtn.swift
//  XrkSwift
//
//  Created by jason on 2018/3/23.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import Foundation
import UIKit
class ZBTN: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let rect = super.titleRect(forContentRect: contentRect)
        return rect
    }
    
}
