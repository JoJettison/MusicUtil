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
    
    //Controls the accidental (sharps, flats, and naturals on a note)
    //Audio values of 1, 3, 6, 8, 10 are either sharp or flat
    //If the audio value is 0, 2, 4, 5, 7, 9, or 11, the value of accidental will be set to -1, an indication that the answerValue does not need to be mutated and the labels of the grid buttons should be all natural
    //If 0, the note is sharp, grid blocks 0, 2, 5, 7, 9 have the potential to be sharp: 0->1, 2->3, 5->6, 7->8, and 9->10
    //If 1, the note is flat, grid blocks 2, 4, 7, 9, 11 have the potential to be flat: 2->1, 4->3, 7->6, 9->8, and 11->10
    var accidental = -1
    
    //Grid Buttons
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
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        newQuestion()
    }
    
    func accidCheck()
    {
        //Updates the value contained within answerValue
        answerValue = audio
//
//        //Reset all labels to natural
//        gridButtonC.setTitle("C", for: .normal)
//        gridButtonD.setTitle("D", for: .normal)
//        gridButtonE.setTitle("E", for: .normal)
//        gridButtonF.setTitle("F", for: .normal)
//        gridButtonG.setTitle("G", for: .normal)
//        gridButtonA.setTitle("A", for: .normal)
//        gridButtonB.setTitle("B", for: .normal)
//
//        if (accidentalNotes.contains(audio))
//        {
//            //The note is accidental, select value to decide if it's set as sharp or flat
//            accidental = Int.random(in: 0...1)
//        }
//        else
//        {
//            //The note is natural
//            accidental = -1
//        }
//
//        if (accidental == 0)
//        {
//            //Change label & answerValue of "C,D,F,G,A" to sharp
//            answerValue = audio - 1
//            //Change C -> C Sharp: 0 -> 1
//            gridButtonC.setTitle("C"+sharpSym, for: .normal)
//            //Change D -> D Sharp: 2 -> 3
//            gridButtonD.setTitle("D"+sharpSym, for: .normal)
//            //E does not have a sharp equivalent
//            gridButtonE.setTitle("E", for: .normal)
//            //Change F -> F Sharp: 5 -> 6
//            gridButtonF.setTitle("F"+sharpSym, for: .normal)
//            //Change G -> G Sharp: 7 -> 8
//            gridButtonG.setTitle("G"+sharpSym, for: .normal)
//            //Change A -> A Sharp: 9 -> 10
//            gridButtonA.setTitle("A"+sharpSym, for: .normal)
//            //B does not have a sharp equivalent
//            gridButtonB.setTitle("B", for: .normal)
//        }
//        else if (accidental == 1)
//        {
//            //Change label & answerValue of "D,E,G,A,B" to flat
//            //Follows the same structure of the sharps
//            answerValue = audio + 1
//            gridButtonC.setTitle("C", for: .normal)
//            gridButtonD.setTitle("D"+flatSym, for: .normal)
//            gridButtonE.setTitle("E"+flatSym, for: .normal)
//            gridButtonF.setTitle("F", for: .normal)
//            gridButtonG.setTitle("G"+flatSym, for: .normal)
//            gridButtonA.setTitle("A"+flatSym, for: .normal)
//            gridButtonB.setTitle("B"+flatSym, for: .normal)
//        }
//        else
//        {
//            //The note is natural
//            answerValue = audio
//        }
    }
    
    func updateScore()
    {
        scoreVal?.text = "\(score)"
    }
    
    func newQuestion()
    {
        sleep(1)
        audio = Int.random(in: 0...11)
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

