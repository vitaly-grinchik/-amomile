//
//  Sector.swift
//  Сamomile
//
//  Created by Виталий Гринчик on 23.08.23.
//

import Foundation

struct Coordinate {
    let x: Double
    let y: Double
}

struct RadialCoordinator {
    let center: Coordinate
    let radius: Double
    let angleDeg: Double
    
    var point: Coordinate {
        let angle = angleDeg * Double.pi / 180
        return Coordinate(
            x: (center.x + radius * cos(angle)).rounded(),
            y: (center.y + radius * sin(angle)).rounded()
        )
    }
}
