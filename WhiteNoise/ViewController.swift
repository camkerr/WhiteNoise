//
//  ViewController.swift
//  WhiteNoise
//
//  Created by Cameron Kerr on 2019-03-17.
//  Copyright © 2019 Cameron Kerr. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    var audioPlayer = AVAudioPlayer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playButton.layer.cornerRadius = 5
        playButton.layer.borderWidth = 1
        playButton.layer.borderColor = UIColor.white.cgColor
        
        pauseButton.layer.cornerRadius = 5
        pauseButton.layer.borderWidth = 1
        pauseButton.layer.borderColor = UIColor.white.cgColor
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "baby_white_noise", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            audioPlayer.numberOfLoops = -1
            
            let audioSession = AVAudioSession.sharedInstance()
            
            do {
                try audioSession.setCategory(.playback, mode: .default, options: .allowAirPlay)
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        
    }
    
    @IBAction func Play(_ sender: Any) {
        audioPlayer.play()
        
    }
    
    @IBAction func Pause(_ sender: Any) {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
            
        } else {
            print("Noise is not playing.")
        }
    }
    
}

