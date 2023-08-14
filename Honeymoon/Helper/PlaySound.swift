//
//  PlaySound.swift
//  Honeymoon
//
//  Created by Matteo Buompastore on 14/08/23.
//

import AVFoundation

var player : AVAudioPlayer?

func playSound(sound : String, type : String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            player?.play()
        } catch(let error) {
            print("Could not play audio file: \(sound): \(error.localizedDescription)")
        }
    }
}
