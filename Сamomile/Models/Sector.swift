//
//  Sector.swift
//  Сamomile
//
//  Created by Виталий Гринчик on 23.08.23.
//

import Foundation

struct Sector {
    
    struct Point {
        let x: Double
        let y: Double
    }
    
    let center: Point
    let radius: Double
    let angleDeg: Double
    
    var radialPoint: Point {
        let angle = angleDeg * Double.pi / 180
        return Point(
            x: (center.x + radius * cos(angle)).rounded(),
            y: (center.y + radius * sin(angle)).rounded()
        )
    }
}
