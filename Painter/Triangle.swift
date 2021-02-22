//
//  Triangle.swift
//  Painter
//
//  Created by Saltanat Nareshova on 13.02.2021.
//

import Foundation
import UIKit

class Triangle {
    private var p1: CGPoint
    private var p2: CGPoint
    private var p3: CGPoint
    private var color: UIColor
    private var stroke_width: CGFloat = 0.0
    private var isFilled: Bool
    
    init(p1: CGPoint, p2: CGPoint, p3: CGPoint, color: UIColor, stroke_width: CGFloat, isFilled: Bool) {
        self.p1 = p1
        self.p2 = p2
        self.p3 = p3
        self.color = color
        self.stroke_width = stroke_width
        self.isFilled = isFilled
    }
    
    func drawPath(){
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.close()
        color.set()
        if isFilled{
            path.fill()
        }else{
            path.stroke()
        }
    }

}
