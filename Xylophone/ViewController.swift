//
//  ViewController.swift
//  Xylophone
//
//  Created by Alexa Cabalceta on 27/1/23.
//

import UIKit
import AVFoundation //AudioVisualFoundationalModule

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func keyPressed(_ sender: UIButton) {

        playSound(soundName: sender.titleLabel?.text ?? "")
    }
    
    func playSound(soundName: String) { 
        //Look in project disk the indicated resource
        guard let url = Bundle.main.url(forResource: "Sounds/\(soundName)", withExtension: "wav") else { return }

        do {
            //even if the mobile is in "Sound Off" Mode, it will execute the sound
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            // Player variable find the sound by URL
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            //Plays the sound
            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}

