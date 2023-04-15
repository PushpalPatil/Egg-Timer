//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 5, "Medium":7, "Hard":12]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        timer.invalidate()
        // do * 60 for final product
        totalTime = eggTimes[hardness]! * 60 
        print(eggTimes[hardness]!)
        
        secondsPassed = 0
        titleLabel.text = hardness
        progressBar.progress = 0.0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0,target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)

    }
    
    // #selector comes from objective C so add @objc
    @objc func updateTimer(){
        if secondsPassed < totalTime{
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
            
        }
        else{
            timer.invalidate()
            titleLabel.text = "Your eggs are ready! :}"
            playSound()
        }
    }
    
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

//        switch hardness {
//        case "Soft":
//            print(eggTimes["Soft"])
//        case "Medium":
//            print(eggTimes["Medium"])
//        case "Hard":
//            print(eggTimes["Hard"])
//        default:
//            print("Error")
//        }
