//
//  PetalView.swift
//  Сamomile
//
//  Created by Виталий Гринчик on 23.08.23.
//

import SwiftUI

struct PetalView: View {
    // Flower abstract proportion ratios:
    private let centerRadiusRatio = 0.25
    private let controlRadiusRatio = 0.8
    private let qtyOfPetals = 18
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let middle = size / 2
            
            let flowerCenter = RadialLocator.Point(x: middle, y: middle)
            let centralRadius = centerRadiusRatio * size / 2
            let curvatureRadius = controlRadiusRatio  * size / 2
            let period = Int(360 / qtyOfPetals)
            
            ForEach(0..<qtyOfPetals) { angle in
                Path { path in
                    let petalStart = RadialLocator(
                        center: flowerCenter,
                        radius: centralRadius,
                        angleDeg: Double(period * angle)
                    )
                    
                    let petalEnd = RadialLocator(
                        center: flowerCenter,
                        radius: middle, // equal to size / 2
                        angleDeg: Double(period * angle)
                    )
                    
                    let control1 = RadialLocator(
                        center: flowerCenter,
                        radius: curvatureRadius,
                        angleDeg: Double(period * angle - 15)
                    )
                    
                    let control2 = RadialLocator(
                        center: flowerCenter,
                        radius: curvatureRadius,
                        angleDeg: Double(period * angle + 15)
                    )
                    
                    path.move(to: CGPoint(x: petalStart.x, y: petalStart.y))
                    path.addQuadCurve(
                        to: CGPoint(x: petalEnd.x, y: petalEnd.y),
                        control: CGPoint(x: control1.x, y: control1.y)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: petalStart.x, y: petalStart.y),
                        control: CGPoint(x: control2.x, y: control2.y)
                    )
                }
                .fill(
                    RadialGradient(
                        colors: [.white, .gray],
                        center: .center,
                        startRadius: 0,
                        endRadius: middle
                    )
                )
            }

            Path { path in
                path.addArc(
                    center: CGPoint(
                        x: flowerCenter.x,
                        y: flowerCenter.y
                    ),
                    radius: centralRadius,
                    startAngle: .degrees(0),
                    endAngle: .degrees(360),
                    clockwise: true
                )
            }
            .fill(.yellow)
        }
    }
}

struct PetalView_Previews: PreviewProvider {
    static var previews: some View {
        PetalView()
            .frame(width: 200, height: 200)
    }
}
