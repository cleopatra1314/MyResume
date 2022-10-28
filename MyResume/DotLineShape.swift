//
//  DotLineShape.swift
//  MyResume
//
//  Created by 黃郁雯 on 2022/10/23.
//

import SwiftUI

struct DotLineShape: Shape {
    enum LineStyle { case buttomHalf, full, topHalf }
    
    var dotSize:CGFloat = 30
    var lineWidth: CGFloat = 10
    var style: LineStyle = .full
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addEllipse(in: CGRect(x: rect.midX - (dotSize / 2),
                                   y: rect.maxY * 0.3,
                                   //style == .buttomHalf ? (rect.maxY * 0.3 - dotSize/2) : style == .full ? (rect.midY - dotSize/2) : (rect.maxY * 0.7 - dotSize/2)
                                    //rect.midY - (dotSize / 2),
                                   width: dotSize,
                                   height: dotSize))
//        path.move(to: CGPoint(x: <#T##Double#>, y: <#T##Double#>))
//        path.addLine(to: CGPoint(x: <#T##Double#>, y: <#T##Double#>))
        path.addRect(CGRect(x: rect.midX - (lineWidth / 2),
                            y: style == .buttomHalf ? rect.maxY * 0.3 : rect.minY,
                            width: lineWidth,
                            height: style == .full ? rect.height : style == .buttomHalf ? rect.height * 0.7 : rect.height * 0.3))
        return path
    }
    
}

struct DotLineShape_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0){
            DotLineShape(style: .buttomHalf).background(.blue)
            DotLineShape(style: .full).background(.yellow)
            DotLineShape(style: .topHalf).background(.blue)
        }
    }
}
