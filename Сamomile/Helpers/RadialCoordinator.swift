//
//  RadialCoordinator.swift
//  Сamomile
//
//  Created by Виталий Гринчик on 23.08.23.
//

import Foundation


struct RadialLocator {
    
    struct Point {
        let x: Double
        let y: Double
    }
    
    let center: Point
    let radius: Double
    let angleDeg: Double
    
    var x: Double {
        (center.x + radius * cos(angle)).rounded()
    }
    
    var y: Double {
        (center.y + radius * sin(angle)).rounded()
    }

    private var angle: Double {
        angleDeg * Double.pi / 180
    }
}
