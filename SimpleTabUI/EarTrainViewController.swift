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
    
    var keyboardView = false
    
    let pianoAnswerDict = [0:"C", 1:"C#", 2:"D", 3:"D#", 4:"E", 5:"F", 6:"F#", 7:"G", 8:"G#", 9:"A", 10:"A#", 11:"B"]
    let whiteKeys = [0, 2, 4, 5, 7, 9, 11]
    let blackKeys = [1, 3, 6, 8, 10]
    
    let accidentalNotes = [1, 3, 6, 8, 10]
    let naturalNotes = [0, 2, 4, 5, 7, 9, 11]
    
    let sharpSym = "\u{266F}"
    let flatSym = "\u{266D}"
    
    let gridAnswerDict = [0:"C", 2:"D", 4:"E", 5:"F", 7:"G", 9:"A", 11:"B"]
    
    //Grid Buttons
    @IBOutlet weak var gridBackground: UIView!
    @IBOutlet weak var gridButtonC: UIButton!
    @IBOutlet weak var gridButtonD: UIButton!
    @IBOutlet weak var gridButtonE: UIButton!
    @IBOutlet weak var gridButtonF: UIButton!
    @IBOutlet weak var gridButtonG: UIButton!
    @IBOutlet weak var gridButtonA: UIButton!
    @IBOutlet weak var gridButtonB: UIButton!
    
    //Piano Keys
    @IBOutlet weak var pianoBackground: UIView!
    @IBOutlet weak var pianoKeyC: UIButton!
    @IBOutlet weak var pianoKeyCsh: UIButton!
    @IBOutlet weak var pianoKeyD: UIButton!
    @IBOutlet weak var pianoKeyDsh: UIButton!
    @IBOutlet weak var pianoKeyE: UIButton!
    @IBOutlet weak var pianoKeyF: UIButton!
    @IBOutlet weak var pianoKeyFsh: UIButton!
    @IBOutlet weak var pianoKeyG: UIButton!
    @IBOutlet weak var pianoKeyGsh: UIButton!
    @IBOutlet weak var pianoKeyA: UIButton!
    @IBOutlet weak var pianoKeyAsh: UIButton!
    @IBOutlet weak var pianoKeyB: UIButton!
    
    //Variables
    var score:Int = 0
    var audio = Int.random(in: 0...6)
    var gridTabOptions = Int.random(in: 0...6)
    //Default initialization for the answer value
    var answerValue = 0
    var audioPlayerC = AVAudioPlayer()
    var audioPlayerCsh = AVAudioPlayer()
    var audioPlayerD = AVAudioPlayer()
    var audioPlayerDsh = AVAudioPlayer()
    var audioPlayerE = AVAudioPlayer()
    var audioPlayerF = AVAudioPlayer()
    var audioPlayerFsh = AVAudioPlayer()
    var audioPlayerG = AVAudioPlayer()
    var audioPlayerGsh = AVAudioPlayer()
    var audioPlayerA = AVAudioPlayer()
    var audioPlayerAsh = AVAudioPlayer()
    var audioPlayerB = AVAudioPlayer()
    
    //Label
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var scoreVal: UILabel!
    
    //Answer Piano Key
    @IBAction func pianoKeyAction(_ sender: UIButton)
    {
        //If the answer is correct & the key is white
        if ((sender as AnyObject).tag == answerValue && whiteKeys.contains((sender as AnyObject).tag ))
        {
            UIButton.animate(withDuration: 0.0, animations:
                {
                    sender.backgroundColor = UIColor(red:0.00, green:0.59, blue:0.08, alpha:1.0)
            },
                             completion:
                {
                    finish in UIButton.animate(withDuration: 0.2, animations:
                        {
                            sender.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
                    })
            })
            print("Right")
            
            score += 1
            updateScore()
        }
        //If the answer is correct & the key is black
        else if ((sender as AnyObject).tag == answerValue && blackKeys.contains((sender as AnyObject).tag ))
        {
            UIButton.animate(withDuration: 0.0, animations:
                {
                    sender.backgroundColor = UIColor(red:0.00, green:0.59, blue:0.08, alpha:1.0)
            },
                             completion:
                {
                    finish in UIButton.animate(withDuration: 0.2, animations:
                        {
                            sender.backgroundColor = UIColor(red:0.00, green:0.00, blue:0.00, alpha:1.0)
                    })
            })
            print("Right")
            
            score += 1
            updateScore()
        }
        //If the answer is incorrect & the key is white
        else if ((sender as AnyObject).tag != answerValue && whiteKeys.contains((sender as AnyObject).tag ))
        {
            UIButton.animate(withDuration: 0.1, animations:
                {
                    sender.backgroundColor = UIColor(red:0.95, green:0.00, blue:0.00, alpha:1.0)
            },
                             completion:
                {
                    finish in UIButton.animate(withDuration: 0.2, animations:
                        {
                            sender.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
                    })
            })
            print("Wrong")
        }
        //If the answer is incorrect and the key is black
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
                            sender.backgroundColor = UIColor(red:0.00, green:0.00, blue:0.00, alpha:1.0)
                    })
            })
            print("Wrong")
        }
        
        //Finally outside the color indication tests
        newQuestion()
    }
    
    //Answer Grid Button
    @IBAction func gridButtonAction(_ sender: UIButton)
    {
        if ((sender as AnyObject).tag == answerValue)
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
        case 0: audioPlayerC.play()
        case 1: audioPlayerCsh.play()
        case 2: audioPlayerD.play()
        case 3: audioPlayerDsh.play()
        case 4: audioPlayerE.play()
        case 5: audioPlayerF.play()
        case 6: audioPlayerFsh.play()
        case 7: audioPlayerG.play()
        case 8: audioPlayerGsh.play()
        case 9: audioPlayerA.play()
        case 10: audioPlayerAsh.play()
        case 11: audioPlayerB.play()
        default: print ("Audio button error")
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        _ = tabBarController as! MuseTabBarController
        self.view.setNeedsDisplay()
        self.view.setNeedsLayout()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        self.view.setNeedsDisplay()
        self.view.setNeedsLayout()
        newQuestion()
        let museTab = tabBarController as! MuseTabBarController
        if museTab.keyView == false
        {
            keyboardView = false
        }
        else
        {
            keyboardView = true
        }
        keyInputSwitch()
        
    }
    
    func accidCheck()
    {
        //Updates the value contained within answerValue
        answerValue = audio
    }
    
    func keyInputSwitch(){
        if (keyboardView == true)
        {
            gridBackground.isHidden = true
            gridButtonA.isHidden = true
            gridButtonB.isHidden = true
            gridButtonC.isHidden = true
            gridButtonD.isHidden = true
            gridButtonE.isHidden = true
            gridButtonF.isHidden = true
            gridButtonG.isHidden = true
            
            pianoBackground.isHidden = false
            pianoKeyC.isHidden = false
            pianoKeyCsh.isHidden = false
            pianoKeyD.isHidden = false
            pianoKeyDsh.isHidden = false
            pianoKeyE.isHidden = false
            pianoKeyF.isHidden = false
            pianoKeyFsh.isHidden = false
            pianoKeyG.isHidden = false
            pianoKeyGsh.isHidden = false
            pianoKeyA.isHidden = false
            pianoKeyAsh.isHidden = false
            pianoKeyB.isHidden = false
        }
        else
        {
            pianoBackground.isHidden = true
            pianoKeyC.isHidden = true
            pianoKeyCsh.isHidden = true
            pianoKeyD.isHidden = true
            pianoKeyDsh.isHidden = true
            pianoKeyE.isHidden = true
            pianoKeyF.isHidden = true
            pianoKeyFsh.isHidden = true
            pianoKeyG.isHidden = true
            pianoKeyGsh.isHidden = true
            pianoKeyA.isHidden = true
            pianoKeyAsh.isHidden = true
            pianoKeyB.isHidden = true
            
            gridBackground.isHidden = false
            gridButtonA.isHidden = false
            gridButtonB.isHidden = false
            gridButtonC.isHidden = false
            gridButtonD.isHidden = false
            gridButtonE.isHidden = false
            gridButtonF.isHidden = false
            gridButtonG.isHidden = false
        }
    }
    
    func updateScore()
    {
        scoreVal?.text = "\(score)"
    }
    
    func newQuestion()
    {
        sleep(1)
        if (keyboardView == true)
        {
            audio = Int.random(in: 0...11)
        }
        else
        {
            gridTabOptions = Int.random(in: 0...6)
            audio = whiteKeys[gridTabOptions]
        }
        accidCheck()
        switch audio
        {
        case 0: audioPlayerC.play()
        case 1: audioPlayerCsh.play()
        case 2: audioPlayerD.play()
        case 3: audioPlayerDsh.play()
        case 4: audioPlayerE.play()
        case 5: audioPlayerF.play()
        case 6: audioPlayerFsh.play()
        case 7: audioPlayerG.play()
        case 8: audioPlayerGsh.play()
        case 9: audioPlayerA.play()
        case 10: audioPlayerAsh.play()
        case 11: audioPlayerB.play()
        default: print ("Audio button error")
        }
        print("Answer: ", audio)
    }
    
    override func viewDidLoad()
    {
        let museTab = tabBarController as! MuseTabBarController
        if museTab.keyView == false {
            keyboardView = false
        }
        else{
            keyboardView = true
        }
        keyInputSwitch()
        
        
        super.viewDidLoad()
        
        if (keyboardView == true)
        {
            gridBackground.isHidden = true
            gridButtonC.isHidden = true
            gridButtonD.isHidden = true
            gridButtonE.isHidden = true
            gridButtonF.isHidden = true
            gridButtonG.isHidden = true
            gridButtonA.isHidden = true
            gridButtonB.isHidden = true
        }
        else
        {
            pianoBackground.isHidden = true
            pianoKeyC.isHidden = true
            pianoKeyCsh.isHidden = true
            pianoKeyD.isHidden = true
            pianoKeyDsh.isHidden = true
            pianoKeyE.isHidden = true
            pianoKeyF.isHidden = true
            pianoKeyFsh.isHidden = true
            pianoKeyG.isHidden = true
            pianoKeyGsh.isHidden = true
            pianoKeyA.isHidden = true
            pianoKeyAsh.isHidden = true
            pianoKeyB.isHidden = true
        }
        
        updateScore()
     
        let soundC = Bundle.main.path(forResource: "C", ofType: "mp3")
        let soundCsh = Bundle.main.path(forResource: "C#", ofType: "mp3")
        let soundD = Bundle.main.path(forResource: "D", ofType: "mp3")
        let soundDsh = Bundle.main.path(forResource: "D#", ofType: "mp3")
        let soundE = Bundle.main.path(forResource: "E", ofType: "mp3")
        let soundF = Bundle.main.path(forResource: "F", ofType: "mp3")
        let soundFsh = Bundle.main.path(forResource: "F#", ofType: "mp3")
        let soundG = Bundle.main.path(forResource: "G", ofType: "mp3")
        let soundGsh = Bundle.main.path(forResource: "G#", ofType: "mp3")
        let soundA = Bundle.main.path(forResource: "A", ofType: "mp3")
        let soundAsh = Bundle.main.path(forResource: "A#", ofType: "mp3")
        let soundB = Bundle.main.path(forResource: "B", ofType: "mp3")
        
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
            audioPlayerCsh = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundCsh!))
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
            audioPlayerDsh = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundDsh!))
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
            audioPlayerFsh = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFsh!))
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
        
        do
        {
            audioPlayerGsh = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundGsh!))
        }
        catch
        {
            print ("Error with sound system")
        }
        
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
            audioPlayerAsh = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundAsh!))
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
        
    }
    
    
}

