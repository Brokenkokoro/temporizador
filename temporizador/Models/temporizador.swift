//
//  temporizador.swift
//  temporizador
//
//  Created by Angel Contreras Medina on 18/07/23.
//

import Foundation

extension ContentView{
    final class ViewModel: ObservableObject{
        @Published var isActive = false
        @Published var showingAlert = false
        @Published var initialState = true
        @Published var endTimer = false
        @Published var time: String = "10:00:00"
        @Published var labelButton: String = "Iniciar"
        @Published var minutes: Float = 10.0 {
            didSet {
                self.time = "\(Int(minutes)):00:00"
            }
        }
        private var seconds = 0
        private var miliseconds = 60
        private var initialTime = 10
        private var auxTime: Float = 0
        private var endDate = Date()
        
        
        func start(minutes: Float) {
            self.initialState = false
            
            switch labelButton {
            case "Pausar":
                self.endDate = Date()
                self.isActive = false
                self.auxTime = self.minutes
                break
            case "Reanudar":
                self.endDate = Date()
                self.isActive = true
                self.endDate = Calendar.current.date(byAdding: .second, value: (Int(minutes) * 60 + seconds) , to: endDate)!
                break
                
            default:
                self.endDate = Date()
                self.isActive = true
                self.endDate = Calendar.current.date(byAdding: .minute, value: Int(minutes), to: endDate)!
            }
        }
        
        
        func reset() {
            self.minutes = Float(initialTime)
            self.isActive = false
            self.time = "\(Int(minutes)):00:00"
            self.initialState = true
            self.endTimer = false
        }
        
        func updateCountdown() {
            guard isActive else {
                
                 if minutes != Float(initialTime) {
                    self.labelButton = "Reanudar"
                }else{
                    self.labelButton = "Aceptar"
                }
                
                return
                
            }
            
            let now = Date()
            let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
            
            self.labelButton = "Pausar"
            
            
            if diff <= 0 {
                self.isActive = false
                self.time = "00:00:00"
                self.endTimer = true
                return
            }
            if miliseconds < 1 {
                self.miliseconds = 60
            }
            
            let date = Date(timeIntervalSince1970: diff)
            let calendar = Calendar.current
            let minutes = calendar.component(.minute, from: date)
            let seconds = calendar.component(.second, from: date)
            self.miliseconds -= 1
            self.minutes = Float(minutes)
            self.seconds = seconds
            print(seconds)
            self.time = String(format: "%d:%02d:%02d", minutes, seconds,self.miliseconds)
            
            
        }
    }
}
