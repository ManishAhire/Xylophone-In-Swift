//
//  ViewController.swift
//  Xylophone In Swift
//
//  Created by Manish Ahire on 01/02/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // AVAudioPlayer plays audio
    var player : AVAudioPlayer!
    
    // Linked multiple buttons to the same @IBAction
    @IBAction func keyPressed(_ sender: UIButton) {
        
        // A guard is used to transfer program control out of scope if conditions aren’t met.
        guard let keyName = sender.titleLabel?.text else {
            print("No title for button")
            return
        }
        
        // Changed button opacity
        sender.layer.opacity = 0.5
        
        // Calling a function with Argument Labels and Parameter Names
        playSound(for: keyName)
        
        // Schedules a block for execution, the block is executed after 0.5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            sender.layer.opacity = 1.0
        }
    }
    
    // A Function with Argument Labels and Parameter Names
    func playSound(for keyName : String) {
        
        guard let soundPath = Bundle.main.url(forResource: keyName, withExtension: ".wav") else {
            print("Sound file not found")
            return
        }
        
        // Plays audio from a file
        player = try! AVAudioPlayer(contentsOf: soundPath)
        player.play()
    }
}
