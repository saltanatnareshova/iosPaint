//
//  Line.swift
//  Painter
//
//  Created by Saltanat Nareshova on 13.02.2021.
//

import Foundation
import UIKit

class Line {
    private var p1: CGPoint
    private var p2: CGPoint
    private var color: UIColor
    private var stroke_width: CGFloat = 0.0

    init(p1: CGPoint, p2: CGPoint, color: UIColor, stroke_width: CGFloat) {
        self.p1 = p1
        self.p2 = p2
        self.color = color
        self.stroke_width = stroke_width
    }
    func drawPath(){
        let line = UIBezierPath()
        line.move(to: CGPoint(x: p1.x, y: p1.y))
        line.addLine(to: CGPoint(x: p2.x, y: p2.y))
        line.close()
        color.set()
        line.stroke()
    }

}
