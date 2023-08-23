//
//  PetalView.swift
//  Сamomile
//
//  Created by Виталий Гринчик on 23.08.23.
//

import SwiftUI

struct PetalView: View {
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let middle = size / 2
            
            // Petal proportions: width to size ratio ...
            let petalWidthRatio = 0.17
            // ... distance from the begining of a petal to max curvature point
            let petalCurvatureTopShift = 0.8
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: middle))
                path.addQuadCurve(
                    to: CGPoint(x: size, y: middle),
                    control: CGPoint(
                        x: size * petalCurvatureTopShift,
                        y: middle - size * petalWidthRatio
                    )
                )
                path.addQuadCurve(
                    to: CGPoint(x: 0, y: middle),
                    control: CGPoint(
                        x: size * petalCurvatureTopShift,
                        y: middle + size * petalWidthRatio
                    )
                )
            }
            .fill(
                LinearGradient(
                    colors: [.white, .gray],
                    startPoint: UnitPoint(
                        x: petalCurvatureTopShift,
                        y: 0.5 - petalWidthRatio / 2
                    ),
                    endPoint: UnitPoint(
                        x: petalCurvatureTopShift,
                        y: 0.5 + petalWidthRatio / 2
                    )
                )
            )
        }
    }
}

struct PetalView_Previews: PreviewProvider {
    static var previews: some View {
        PetalView()
            .frame(width: 250, height: 250)
    }
}
