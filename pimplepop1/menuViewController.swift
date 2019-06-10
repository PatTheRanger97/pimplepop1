//
//  menuViewController.swift
//  pimplepop1
//
//  Created by Patrick Sebastian Lie on 25/05/19.
//  Copyright © 2019 Patrick Sebastian Lie. All rights reserved.
//

import UIKit
import AVFoundation

class menuViewController: UIViewController {
    @IBOutlet weak var btn: UIButton!
    
    @IBAction func btn2(_ sender: Any) {
        self.sound.play()
    }
    
    var sound = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
btn.layer.cornerRadius = 20.0
        btn.layer.masksToBounds = true
        do{
            let url = URL(fileURLWithPath: Bundle.main.path(forResource: "pop", ofType: "mp3")!)
            sound = try AVAudioPlayer(contentsOf: url)
            sound.numberOfLoops = 1
            sound.prepareToPlay()
            sound.volume = 10
        }catch{
            print("cant play audio")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        /*let hscore1 = UserDefaults.standard.string(forKey: "Key")
        highscore1.text = String(hscore1 ?? "0")*/
    }
    
    // Biji Kuda

}

