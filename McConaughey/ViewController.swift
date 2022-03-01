//
//  ViewController.swift
//  McConaughey
//
//  Created by Timothy Chin on 2/28/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var alrightNumLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var audioPlayer: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alrightNumLabel.text = "\(Int(stepper.value))"

    }
    
    func playSound(name: String, numOfLoops: Int){
        if let sound = NSDataAsset(name: name){
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.numberOfLoops = numOfLoops-1
                audioPlayer.play()
            } catch {
                print("🤬 ERROR: \(error.localizedDescription) Could not initialize AvAudioPlayer object")
            }
        } else {
            print("🤬 ERROR: Could not read data from file sound0")
        }
    }

    @IBAction func stepperChanged(_ sender: UIStepper) {
        
        alrightNumLabel.text = "\(Int(stepper.value))"

    }
    
    @IBAction func tellMePressed(_ sender: UIButton) {
        
        playSound(name: "alright", numOfLoops: Int(stepper.value))
    }
    
    
}

