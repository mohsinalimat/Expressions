//
//  CGRect.swift
//  Expression
//
//  Created by Michael Pangburn on 12/15/17.
//  Copyright © 2017 Michael Pangburn. All rights reserved.
//

import CoreGraphics


extension CGRect {
    init(center: CGPoint, size: CGSize) {
        let origin = CGPoint(x: center.x - size.width / 2, y: center.y - size.height / 2)
        self.init(origin: origin, size: size)
    }

    init(topLeft: CGPoint, bottomRight: CGPoint) {
        assert(bottomRight.x > topLeft.x && bottomRight.y > topLeft.y)
        let width = abs(bottomRight.x - topLeft.x)
        let height = abs(bottomRight.y - topLeft.y)
        let size = CGSize(width: width, height: height)
        self.init(origin: topLeft, size: size)
    }

    init(containing points: CGPoint...) {
        let xs = points.map { $0.x }
        let ys = points.map { $0.y }
        let topLeft = CGPoint(x: xs.min()!, y: ys.min()!)
        let bottomRight = CGPoint(x: xs.max()!, y: ys.max()!)
        self.init(topLeft: topLeft, bottomRight: bottomRight)
    }
}
