//
//  MotionManager.swift
//  temporizador
//
//  Created by Angel Contreras Medina on 21/07/23.
//

import SwiftUI
import CoreMotion
import AVFoundation

class MotionManager: ObservableObject {
    private let motionManager = CMMotionManager()
    @Published var isDeviceOnTable = false
    init() {
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: .main){ (data, error) in
            guard let acceleration = data?.acceleration else { return }
            
            self.isDeviceOnTable = (acceleration.z < -0.9)
            
        }
    }
    
}


