//
//  Level1ViewController.swift
//  pimplepop1
//
//  Created by Patrick Sebastian Lie on 24/05/19.
//  Copyright © 2019 Patrick Sebastian Lie. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation
import Foundation

class Level1ViewController: UIViewController {

    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var timerlabel: UILabel!
    let notif = UINotificationFeedbackGenerator()
    var imageCar = UIImageView()
    var imageArray: [UIImage] = []
    var sound = AVAudioPlayer()
    var startInt = 30
    var startTimer = Timer()
    var tapInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //call timer
        startTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Level1ViewController.startGameTimer), userInfo: nil, repeats: true)
        startInt = 30
        timerlabel.text = String(startInt)
        //call audio
        do{
            let url = URL(fileURLWithPath: Bundle.main.path(forResource: "pop", ofType: "mp3")!)
            sound = try AVAudioPlayer(contentsOf: url)
            sound.numberOfLoops = 1
            sound.prepareToPlay()
            sound.volume = 10
        }catch{
            print("cant play audio")
        }
        if imageArray.count > 3
        {
            print("more than 3")
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        for index in 1 ... 11{
            self.imageArray.append(UIImage(named: "pimples\(index)")!)
        }
        //timer
        let timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: { timer in
            print("popped")
            //spawn pimple
            let imagePimple = UIImageView(frame: CGRect(x: .random(in: 25...300), y: .random(in: 200...700), width: 150, height: 100));
            //spawn pimple animation
            UIView.animate(withDuration: 0.2, delay: 0.5, animations: {
                imagePimple.alpha = 0
            })
            UIView.animate(withDuration: 0.2, delay: 0.5, animations: {
                imagePimple.alpha = 1
            })
            //pimple to subview
            imagePimple.image = UIImage(named: "pimples1")
            self.view.addSubview(imagePimple)
            //detect gesture
            let gesture = UITapGestureRecognizer(target:self, action: #selector(self.tapdetected))
            imagePimple.isUserInteractionEnabled = true
            imagePimple.addGestureRecognizer(gesture)
            Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { Timer in imagePimple.isHidden = true})
        })
        //timer 2
        let timer2 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            print("popped")
            //spawn pimple
            let imagePimple2 = UIImageView(frame: CGRect(x: .random(in: 25...300), y: .random(in: 200...700), width: 150, height: 100));
            //spawn pimple animation 2
            UIView.animate(withDuration: 0.2, delay: 0.5, animations: {
                imagePimple2.alpha = 0
            })
            UIView.animate(withDuration: 0.2, delay: 0.5, animations: {
                imagePimple2.alpha = 1
            })
            //pimple to subview 2
            imagePimple2.image = UIImage(named: "pimples1")
            self.view.addSubview(imagePimple2)
            //detect gesture 2
            let gesture = UITapGestureRecognizer(target:self, action: #selector(self.tapdetected))
            imagePimple2.isUserInteractionEnabled = true
            imagePimple2.addGestureRecognizer(gesture)
            Timer.scheduledTimer(withTimeInterval: 7, repeats: false, block: { Timer in imagePimple2.isHidden = true})
        })
        let timer3 = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { timer in
            print("popped")
            //spawn pimple
            let imagePimple3 = UIImageView(frame: CGRect(x: .random(in: 25...300), y: .random(in: 200...700), width: 150, height: 100));
            //spawn pimple animation 2
            UIView.animate(withDuration: 0.2, delay: 0.5, animations: {
                imagePimple3.alpha = 0
            })
            UIView.animate(withDuration: 0.2, delay: 0.5, animations: {
                imagePimple3.alpha = 1
            })
            //pimple to subview 2
            imagePimple3.image = UIImage(named: "pimples1")
            self.view.addSubview(imagePimple3)
            //detect gesture 2
            let gesture = UITapGestureRecognizer(target:self, action: #selector(self.tapdetected))
            imagePimple3.isUserInteractionEnabled = true
            imagePimple3.addGestureRecognizer(gesture)
            Timer.scheduledTimer(withTimeInterval: 10, repeats: false, block: { Timer in imagePimple3.isHidden = true})
        })
    }
    //on detect gesture function
    @objc func tapdetected(car: UITapGestureRecognizer){
        print("tapped")
        self.sound.play()
        self.tap()
        /*self.notif.notificationOccurred(.success)*/
        //on gesture animate
        let coba = car.view as? UIImageView
        if coba != nil {
            UIView.animate(withDuration: 2, delay: 1, animations: {
                coba!.animationImages = self.imageArray
                coba!.animationDuration = 0.5
                coba!.startAnimating()
                //start deanimation
            }){(true) in
                UIView.animate(withDuration: 0.3, delay: 0.5, animations: {
                    coba!.alpha = 0.0
                }, completion: {(true) in
                    coba!.stopAnimating()
                    print("done")
                   
                })
            }
        }
    }
    //timer
    @objc func startGameTimer(){
    startInt -= 1
        timerlabel.text = String(startInt)
        if startInt == 0{
            startTimer.invalidate()
            let saveScore = score.text
            UserDefaults.standard.set(saveScore, forKey: "Key")
            //on timer end action
            /*let alert = UIAlertController(title: "Game Over", message: "Back to Main Menu", preferredStyle: .alert)
            self.present(alert, animated: true)
            //alert button back to main menu
            alert.addAction(UIAlertAction(title: "Back", style: UIAlertAction.Style.default, handler: {(alert: UIAlertAction!)in self.performSegue(withIdentifier: "level1tomain", sender: self)}))
            */
            performSegue(withIdentifier: "toscore", sender: self)
        }
    }
    //tap score function
    func tap(){
        tapInt += 1
        score.text = String(tapInt)
    }
    
    func countdown(){
        
    }
    
}
