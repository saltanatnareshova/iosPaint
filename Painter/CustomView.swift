//
//  CustomView.swift
//  Painter
//
//  Created by Saltanat Nareshova on 13.02.2021.
//

import UIKit

class CustomView: UIView {
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let circle = Circle.init(radius: 20, circle_center: center, color: .blue, stroke_width: 4, isFilled: true)
        circle.drawPath()
        
        let rectangle = Rectangle.init(p1: center, p2: CGPoint(x: 0, y: 0), color: .red, stroke_width: 1, isFilled: true)
        rectangle.drawPath()
        
       let line1 = Line.init(p1: center, p2: CGPoint(x: 10, y: 20), color: .blue, stroke_width: 1)
        line1.drawPath()
        
        let triangle = Triangle.init(p1: CGPoint(x: 80, y: 50), p2: CGPoint(x: 140, y: 150), p3: CGPoint(x: 100, y: 150), color: .purple, stroke_width: 1, isFilled: true)
        triangle.drawPath()
        
        
        guard let context = UIGraphicsGetCurrentContext() else
        { return }

        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(10)

        lines.forEach { (line) in
            for (i, p) in line.enumerated(){
                if i == 0{
                    context.move(to: p)
                }else{
                    context.addLine(to: p)
                }
            }
        }


        context.strokePath()
    }
    var lines = [[CGPoint]]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
        guard var lastline=lines.popLast() else {
            return
        }
        lastline.append(point)
        lines.append(lastline)
        setNeedsDisplay()
    }
}
