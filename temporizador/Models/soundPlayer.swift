//
//  soundPlayer.swift
//  temporizador
//
//  Created by Angel Contreras Medina on 20/07/23.
//

import Foundation
import AVKit
import AVFoundation

struct SoundPlayer {
    let name: String
    var player: AVAudioPlayer?
    
    
    mutating func play() {
        guard let url = Bundle.main.url(forResource: name, withExtension: "wav")else {
            return
        }
        do{
            player = try AVAudioPlayer(contentsOf: url)
            
            player?.play()
        } catch {
            print("No se encuentra la musica")
        }
    }
    
}
