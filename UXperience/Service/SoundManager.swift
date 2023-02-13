//
//  SoundManager.swift
//  UXperience
//
//  Created by Luiz Sena on 25/11/22.
//

import Foundation
import AVKit

class SoundManager {

    static let instance = SoundManager()

    var player: AVAudioPlayer?

    func playSound(with name: String) {

        guard let url = Bundle.main.url(
            forResource: name, withExtension: ".mp3"
        ) else { return }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }

    }
    
    private init(player: AVAudioPlayer? = nil) {
        self.player = player
    }
}
