//
// scoreViewController.swift
//  pimplepop1
//
//  Created by Patrick Sebastian Lie on 26/05/19.
//  Copyright © 2019 Patrick Sebastian Lie. All rights reserved.
//

import UIKit
import AVFoundation

class scoreViewController: UIViewController {

    @IBOutlet weak var score: UILabel!
    @IBAction func back(_ sender: Any) {
        performSegue(withIdentifier: "tomenu", sender: self)
    }
    var sound = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            let url = URL(fileURLWithPath: Bundle.main.path(forResource: "clap", ofType: "mp3")!)
            sound = try AVAudioPlayer(contentsOf: url)
            sound.numberOfLoops = 0
            sound.prepareToPlay()
            sound.volume = 3
        }catch{
            print("cant play audio")
        }
        self.sound.play()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let hscore1 = UserDefaults.standard.string(forKey: "Key")
        score.text = String(hscore1 ?? "0")
    }
}
