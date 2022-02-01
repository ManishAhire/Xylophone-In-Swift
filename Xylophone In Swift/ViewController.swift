//
//  ViewController.swift
//  Xylophone In Swift
//
//  Created by Manish Ahire on 01/02/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        guard let keyName = sender.titleLabel?.text else {
            print("No title for button")
            return
        }
        sender.layer.opacity = 0.5
        playSound(for: keyName)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            sender.layer.opacity = 1.0
        }
    }
    
    func playSound(for keyName : String) {
        
        guard let soundPath = Bundle.main.url(forResource: keyName, withExtension: ".wav") else {
            print("Sound file not found")
            return
        }
        player = try! AVAudioPlayer(contentsOf: soundPath)
        player.play()
    }
}

