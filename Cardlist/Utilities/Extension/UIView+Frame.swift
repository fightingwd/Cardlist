//
//  UIView+Frame.swift
//  Cardlist
//
//  Created by m on 2020/6/5.
//  Copyright © 2020 m. All rights reserved.
//

import UIKit

extension UIView {
    var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.frame.size = newValue
        }
    }
}
