//
//  SecondViewController.swift
//  SimpleTabUI
//
//  Created by Joseph on 2/13/19.
//  Copyright © 2019 Joseph. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    var keyboardView = true
    
    let buttonTitles = ["A", "B", "C", "D", "E", "F", "G"]
    let answers = ["A": 0, "B": 1, "C": 2, "D": 3, "E": 4, "F": 5, "G": 6]
    
    //Buttons
    @IBOutlet weak var gridButtonA: UIButton!
    @IBOutlet weak var gridButtonB: UIButton!
    @IBOutlet weak var gridButtonC: UIButton!
    @IBOutlet weak var gridButtonD: UIButton!
    @IBOutlet weak var gridButtonE: UIButton!
    @IBOutlet weak var gridButtonF: UIButton!
    @IBOutlet weak var gridButtonG: UIButton!
    
    //Variables
    var score:Int = 0
    var audio = Int.random(in: 0...6)
    var audioPlayerA = AVAudioPlayer()
    var audioPlayerB = AVAudioPlayer()
    var audioPlayerC = AVAudioPlayer()
    var audioPlayerD = AVAudioPlayer()
    var audioPlayerE = AVAudioPlayer()
    var audioPlayerF = AVAudioPlayer()
    var audioPlayerG = AVAudioPlayer()
    
    //Label
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var scoreVal: UILabel!
    
    //Answer Button
    @IBAction func Action(_ sender: UIButton)
    {
        if ((sender as AnyObject).tag == Int(audio))
        {
            UIButton.animate(withDuration: 0.0, animations:
                {
                    sender.backgroundColor = UIColor(red:0.00, green:0.59, blue:0.08, alpha:1.0)
            },
                             completion:
                {
                    finish in UIButton.animate(withDuration: 0.2, animations:
                        {
                            sender.backgroundColor = UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0)
                    })
            })
            print("Right")
            
            score += 1
            updateScore()
        }
        else
        {
            UIButton.animate(withDuration: 0.1, animations:
                {
                    sender.backgroundColor = UIColor(red:0.95, green:0.00, blue:0.00, alpha:1.0)
            },
                             completion:
                {
                    finish in UIButton.animate(withDuration: 0.2, animations:
                        {
                            sender.backgroundColor = UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0)
                    })
            })
            print("Wrong")
        }
        
        newQuestion()
        
    }
    
    
    //Play Button
    @IBAction func Play(_ sender: Any)
    {
        switch audio
        {
        case 0: audioPlayerA.play()
        case 1: audioPlayerB.play()
        case 2: audioPlayerC.play()
        case 3: audioPlayerD.play()
        case 4: audioPlayerE.play()
        case 5: audioPlayerF.play()
        case 6: audioPlayerG.play()
        default: print ("Audio button error")
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        newQuestion()
    }
    
    func updateScore()
    {
        scoreVal?.text = "\(score)"
    }
    
    func newQuestion()
    {
        sleep(1)
        audio = Int.random(in: 0...6)
        switch audio
        {
        case 0: audioPlayerA.play()
        case 1: audioPlayerB.play()
        case 2: audioPlayerC.play()
        case 3: audioPlayerD.play()
        case 4: audioPlayerE.play()
        case 5: audioPlayerF.play()
        case 6: audioPlayerG.play()
        default: print ("Audio button error")
        }
        print("Answer: ", audio)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if (keyboardView == true)
        {
            gridButtonA.isHidden = true
            gridButtonB.isHidden = true
            gridButtonC.isHidden = true
            gridButtonD.isHidden = true
            gridButtonE.isHidden = true
            gridButtonF.isHidden = true
            gridButtonG.isHidden = true
        }
        
        updateScore()
        // Do any additional setup after loading the view, typically from a nib.
        
        let soundA = Bundle.main.path(forResource: "A", ofType: "mp3")
        let soundB = Bundle.main.path(forResource: "B", ofType: "mp3")
        let soundC = Bundle.main.path(forResource: "C", ofType: "mp3")
        let soundD = Bundle.main.path(forResource: "D", ofType: "mp3")
        let soundE = Bundle.main.path(forResource: "E", ofType: "mp3")
        let soundF = Bundle.main.path(forResource: "F", ofType: "mp3")
        let soundG = Bundle.main.path(forResource: "G", ofType: "mp3")
        
        do
        {
            audioPlayerA = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundA!))
        }
        catch
        {
            print ("Error with sound system")
        }
        
        do
        {
            audioPlayerB = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundB!))
        }
        catch
        {
            print ("Error with sound system")
        }
        
        do
        {
            audioPlayerC = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundC!))
        }
        catch
        {
            print ("Error with sound system")
        }
        
        do
        {
            audioPlayerD = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundD!))
        }
        catch
        {
            print ("Error with sound system")
        }
        
        do
        {
            audioPlayerE = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundE!))
        }
        catch
        {
            print ("Error with sound system")
        }
        
        do
        {
            audioPlayerF = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundF!))
        }
        catch
        {
            print ("Error with sound system")
        }
        
        do
        {
            audioPlayerG = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundG!))
        }
        catch
        {
            print ("Error with sound system")
        }
    }
    
    
}

