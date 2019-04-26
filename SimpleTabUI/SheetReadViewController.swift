//
//  SheetReadViewController.swift
//  SimpleTabUI
//
//  Created by Joseph on 2/15/19.
//  Copyright © 2019 Joseph. All rights reserved.
//

import UIKit

class SheetReadViewController: UIViewController {
    
    var keyboardView = true
    
    let flatSym = "\u{266D}"
    let sharpSym = "\u{266F}"
    
    // Note Variables [Notes are uniquely identified by their NoteID. These match the answer button tags]
    var trNoteC = StaffNote(NoteVal: "C", NoteID: 0, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Ctreble-1-1")!)
    var baNoteC = StaffNote(NoteVal: "C", NoteID: 0, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Cbass2-1")!)
    var trNoteCsh = StaffNote(NoteVal: "C sharp", NoteID: 1, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Cshtreble-1-1" )!)
    var baNoteCsh = StaffNote(NoteVal: "C sharp", NoteID: 1, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Cshbass1-1")!)
    
    //var trNoteDfl = StaffNote(NoteVal: "D flat", NoteID: 1, natShaFla: accidental(rawValue: 2)!, image: UIImage(named: "nameofimage")!)
    //var baNoteDfl = StaffNote(NoteVal: "D flat", NoteID: 1, natShaFla: accidental(rawValue: 2)!, image: UIImage(named: "nameofimage")!)
    var trNoteD = StaffNote(NoteVal: "D", NoteID: 2, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Dtreble-1-1")!)
    var baNoteD = StaffNote(NoteVal: "D", NoteID: 2, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Dbass1-1")!)
    var trNoteDsh = StaffNote(NoteVal: "D sharp", NoteID: 3, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Dshtreble-1-1")!)
    var baNoteDsh = StaffNote(NoteVal: "D sharp", NoteID: 3, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Dshbass1-1")!)
  
    var trNoteEfl = StaffNote(NoteVal: "E flat", NoteID: 3, natShaFla: accidental(rawValue: 2)!, image: UIImage(named: "Efltreble-1-1")!)
    var baNoteEfl = StaffNote(NoteVal: "E flat", NoteID: 3, natShaFla: accidental(rawValue: 2)!, image: UIImage(named: "Eflbass1-1")!)
    var trNoteE = StaffNote(NoteVal: "E", NoteID: 4, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Etreble-1-1")!)
    var baNoteE = StaffNote(NoteVal: "E", NoteID: 4, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Ebass2-1")!)
    
    var trNoteF = StaffNote(NoteVal: "F", NoteID: 5, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Ftreble-1-1")!)
    var baNoteF = StaffNote(NoteVal: "F", NoteID: 5, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Fbass1-1")!)
    var trNoteFsh = StaffNote(NoteVal: "F sharp", NoteID: 6, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Fshtreble-1-1")!)
    var baNoteFsh = StaffNote(NoteVal: "F sharp", NoteID: 6, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Fshbass1-1")!)
    
    var trNoteGfl = StaffNote(NoteVal: "G flat", NoteID: 6, natShaFla: accidental(rawValue: 2)!, image: UIImage(named: "Gfltreble-1-1")!)
    var baNoteGfl = StaffNote(NoteVal: "G flat", NoteID: 6, natShaFla: accidental(rawValue: 2)!, image: UIImage(named: "Gflbass1-1")!)
    var trNoteG = StaffNote(NoteVal: "G", NoteID: 7, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Gtreble-1-1")!)
    var baNoteG = StaffNote(NoteVal: "G", NoteID: 7, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Gbass2-1")!)
    var trNoteGsh = StaffNote(NoteVal: "G sharp", NoteID: 8, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Gshtreble-1-1")!)
    var baNoteGsh = StaffNote(NoteVal: "G sharp", NoteID: 8, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Gshbass1-1")!)
    
    var trNoteAfl = StaffNote(NoteVal: "A flat", NoteID: 8, natShaFla: accidental(rawValue: 2)!, image: UIImage(named: "Afltreble-1-1")!)
    var baNoteAfl = StaffNote(NoteVal: "A flat", NoteID: 8, natShaFla: accidental(rawValue: 2)!, image: UIImage(named: "Aflbass1-1")!)
    var trNoteA = StaffNote(NoteVal: "A", NoteID: 9, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Atreble-1-1")!)
    var baNoteA = StaffNote(NoteVal: "A", NoteID: 9, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Abass1-1")!)
    var trNoteAsh = StaffNote(NoteVal: "A sharp", NoteID: 10, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Ashtreble-1-1")!)
    var baNoteAsh = StaffNote(NoteVal: "A sharp", NoteID: 10, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Ashbass1-1")!)
   
    var trNoteBfl = StaffNote(NoteVal: "B flat", NoteID: 10, natShaFla: accidental(rawValue: 2)!, image: UIImage(named: "Bfltreble-1-1")!)
    var baNoteBfl = StaffNote(NoteVal: "B flat", NoteID: 10, natShaFla: accidental(rawValue: 2)!, image: UIImage(named: "Bflbass1-1")!)
    var trNoteB = StaffNote(NoteVal: "B", NoteID: 11, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Btreble-1-1")!)
    var baNoteB = StaffNote(NoteVal: "B", NoteID: 11, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Bbass1-1")!)
    
    
    // initialize utility variables
    var randsel = Int.random(in: (0..<7))
    var score = 0
    var highscore = 0
    var lifecount = 3
    var cycle = 0
    var hasSwitched = false
    var gameMode = true
    var trebleNotes: [StaffNote] = []
    var bassNotes: [StaffNote] = []
    var grandNotes: [StaffNote] = []
    
    let whiteKeys = [0, 2, 4, 5, 7, 9, 11]
    let blackKeys = [1, 3, 6, 8, 10]
    
    //Staff Image and Staff Selection
    @IBOutlet weak var staffImage: UIImageView!
    @IBOutlet weak var staffSelector: UISegmentedControl!
    
    //Grid Buttons
    @IBOutlet weak var gridButtonA: UIButton!
    @IBOutlet weak var gridButtonB: UIButton!
    @IBOutlet weak var gridButtonC: UIButton!
    @IBOutlet weak var gridButtonD: UIButton!
    @IBOutlet weak var gridButtonE: UIButton!
    @IBOutlet weak var gridButtonF: UIButton!
    @IBOutlet weak var gridButtonG: UIButton!
    
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
    
    //Labels
    @IBOutlet weak var lifeLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var livesText: UILabel!
    
    //Answer Piano Key
    @IBAction func pianoKeyAction(_ sender: UIButton)
    {
        //If the answer is correct & the key is white
        if ((sender as AnyObject).tag == trebleNotes[randsel].NoteID && whiteKeys.contains((sender as AnyObject).tag ))
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
            //updateScore()
        }
            //If the answer is correct & the key is black
        else if ((sender as AnyObject).tag == trebleNotes[randsel].NoteID && blackKeys.contains((sender as AnyObject).tag ))
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
            //updateScore()
        }
            //If the answer is incorrect & the key is white
        else if ((sender as AnyObject).tag != trebleNotes[randsel].NoteID && whiteKeys.contains((sender as AnyObject).tag ))
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
    @IBAction func Answer(_ sender: UIButton) {
        
        if (sender as AnyObject).tag == trebleNotes[randsel].NoteID{
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
            print("Score: ", score)
        }
        else{
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
            lifecount -= 1
            print("Score: ", score)
            print("life: ", lifecount)
            if(lifecount == 0){
                
                lifecount = 3;
                score = 0;
            }
        }
        sleep(1)
        newQuestion()
    }
    
   
    
    //Segmented control update
    @IBAction func staffChange(_ sender: UISegmentedControl) {
        
        if staffSelector.selectedSegmentIndex == 0{
            randsel = Int.random(in: (0..<trebleNotes.count))
            staffImage.image =  trebleNotes[randsel].image
            accidCheck()
            print("Answer: ",trebleNotes[randsel].NoteVal!)
            
        } else if (staffSelector.selectedSegmentIndex == 1) {
            randsel = Int.random(in: (0..<bassNotes.count))
            staffImage.image = bassNotes[randsel].image
            accidCheck()
            print("Answer: ",bassNotes[randsel].NoteVal!)
            
        }  else{
            //randsel = Int.random(in: (0..<grandNotes.count))
            staffImage.image = UIImage(named: "FullStaff")
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let museTab = tabBarController as! MuseTabBarController
        lifecount = museTab.lifeNum
    }
    
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
        let museTab = tabBarController as! MuseTabBarController
        if museTab.keyView == false {
            keyboardView = false
        }
        else{
            keyboardView = true
        }
        keyInputSwitch()
        
        if museTab.gameMode == true{
            gameMode = true
        }
        else{
            gameMode = false
        }
        lifecount = museTab.lifeNum
        initGame()
    }
    
    
    override func viewDidLoad() {
        
        let museTab = tabBarController as! MuseTabBarController
        if museTab.keyView == false {
            keyboardView = false
        }
        else{
            keyboardView = true
        }
        keyInputSwitch()
        
        initStaffNotes()
        accidCheck()        // Check on load if sharp or flat is displayed
        if museTab.gameMode == true{
            gameMode = true
        }
        else{
            gameMode = false
        }
        lifecount = museTab.lifeNum
        initGame()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    func initStaffNotes(){
        //Add Treble notes to the array
        trebleNotes.append(trNoteA)
        trebleNotes.append(trNoteB)
        trebleNotes.append(trNoteC)
        trebleNotes.append(trNoteD)
        trebleNotes.append(trNoteE)
        trebleNotes.append(trNoteF)
        trebleNotes.append(trNoteG)
        //Add sharps & flats
        trebleNotes.append(trNoteAsh)
        trebleNotes.append(trNoteAfl)
        trebleNotes.append(trNoteBfl)
        trebleNotes.append(trNoteCsh)
        trebleNotes.append(trNoteDsh)
        trebleNotes.append(trNoteEfl)
        trebleNotes.append(trNoteFsh)
        trebleNotes.append(trNoteGsh)
        trebleNotes.append(trNoteGfl)
        //Add Bass notes to the array
        bassNotes.append(baNoteA)
        bassNotes.append(baNoteB)
        bassNotes.append(baNoteC)
        bassNotes.append(baNoteD)
        bassNotes.append(baNoteE)
        bassNotes.append(baNoteF)
        bassNotes.append(baNoteG)
        //add sharps & flats
        bassNotes.append(baNoteAsh)
        bassNotes.append(baNoteAfl)
        bassNotes.append(baNoteBfl)
        bassNotes.append(baNoteCsh)
        bassNotes.append(baNoteDsh)
        bassNotes.append(baNoteEfl)
        bassNotes.append(baNoteFsh)
        bassNotes.append(baNoteGsh)
        bassNotes.append(baNoteGfl)
    }
    
    
    func imgSwitcher(){ //Used to switch the image associated with the Note variable
           if (!hasSwitched){
                trNoteC.image = UIImage(named: "Ctreble-2-1")
                baNoteC.image = UIImage(named: "Cbass1-1")
                trNoteD.image = UIImage(named: "Dtreble-2-1")
                trNoteE.image = UIImage(named: "Etreble-2-1")
                baNoteE.image = UIImage(named: "Ebass-1")
                baNoteF.image = UIImage(named: "Fbass2-1")
                trNoteG.image = UIImage(named:"Gtreble-2-1")
                baNoteG.image = UIImage(named: "Gbass1-1")
                baNoteA.image = UIImage(named: "Abass2-1")
                baNoteB.image = UIImage(named: "Bbass2-1")
                hasSwitched = true
            }
            else{
                trNoteC.image = UIImage(named: "Ctreble-1-1")
                baNoteC.image = UIImage(named: "Cbass2-1")
                trNoteD.image = UIImage(named: "Dtreble-1-1")
                trNoteE.image = UIImage(named: "Etreble-1-1")
                baNoteE.image = UIImage(named: "Ebass-2-1")
                baNoteF.image = UIImage(named: "Fbass1-1")
                trNoteG.image = UIImage(named:"Gtreble-1-1")
                baNoteG.image = UIImage(named: "Gbass2-1")
                baNoteA.image = UIImage(named: "Abass1-1")
                baNoteB.image = UIImage(named: "Bbass1-1")
                hasSwitched = false
            }
    }
    
    func highScoreUpdate() {
        
        if(score > highscore){
            highscore = score
            //highscorelbl.Text = highscore
        }
    }
    
    func keyInputSwitch(){
        if (keyboardView == true)
        {
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
            
            gridButtonA.isHidden = false
            gridButtonB.isHidden = false
            gridButtonC.isHidden = false
            gridButtonD.isHidden = false
            gridButtonE.isHidden = false
            gridButtonF.isHidden = false
            gridButtonG.isHidden = false
        }
    }
    
    func accidCheck(){
        let trebAccVal = trebleNotes[randsel].nsf.rawValue
        let bassAccVal = bassNotes[randsel].nsf.rawValue
        
        if( (trebAccVal == 1) || (bassAccVal == 1) ){//Sharp
            gridButtonA.setTitle("A"+sharpSym, for: .normal)
            gridButtonC.setTitle("C"+sharpSym, for: .normal)
            gridButtonD.setTitle("D"+sharpSym, for: .normal)
            gridButtonF.setTitle("F"+sharpSym, for: .normal)
            gridButtonG.setTitle("G"+sharpSym, for: .normal)
        }
        else if( (trebAccVal == 2) || (bassAccVal == 2) ){//Flat
            gridButtonA.setTitle("A"+flatSym, for: .normal)
            gridButtonB.setTitle("B"+flatSym, for: .normal)
            gridButtonD.setTitle("D"+flatSym, for: .normal)
            gridButtonE.setTitle("E"+flatSym, for: .normal)
            gridButtonG.setTitle("G"+flatSym, for: .normal)
            
        }
        else{   //Reset to default label
            gridButtonA.setTitle("A", for: .normal)
            gridButtonB.setTitle("B", for: .normal)
            gridButtonC.setTitle("C", for: .normal)
            gridButtonD.setTitle("D", for: .normal)
            gridButtonE.setTitle("E", for: .normal)
            gridButtonF.setTitle("F", for: .normal)
            gridButtonG.setTitle("G", for: .normal)
        }
        
    }
    
    func initGame(){
        if (!gameMode){
            livesText.isHidden = true
            lifeLbl.isHidden = true
            lifecount = -1
        }
        else{
            livesText.isHidden = false
            lifeLbl.isHidden = false
        }
    }

    
    func newQuestion(){
        //Display score
       scoreLbl.text = "\(score)"
        //Display lives
       lifeLbl.text = "\(lifecount)"
        cycle += 1
        //Check which selector is in use
        switch(staffSelector.selectedSegmentIndex){
        case 0:
            randsel = Int.random(in: 0..<trebleNotes.count)
            staffImage.image =  trebleNotes[randsel].image
            accidCheck()
            print("Answer: ",trebleNotes[randsel].NoteVal!)
        case 1:
            randsel = Int.random(in: 0..<bassNotes.count)
            staffImage.image = bassNotes[randsel].image
            accidCheck()
            print("Answer: ",bassNotes[randsel].NoteVal!)
        case 2:
             randsel = Int.random(in: 0..<grandNotes.count)
             accidCheck()
        default:
             randsel = 0
             accidCheck()
        }
        if(cycle % 5 == 0){ //Change up the images so its not the same sequence endlessly
            imgSwitcher()
        }
    }
   
  }





