//
//  SheetReadViewController.swift
//  SimpleTabUI
//
//  Created by Joseph on 2/15/19.
//  Copyright © 2019 Joseph. All rights reserved.
//

import UIKit

class SheetReadViewController: UIViewController {
    
    let flatSym = "\u{266D}"
    let sharpSym = "\u{266F}"
    
    // Note Variables [Notes are uniquely identified by their NoteID. These match the answer button tags]
    var CnoteTr = StaffNote(NoteVal: "C", NoteID: 0, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Ctreble-1-1")!)
    var CnoteBa = StaffNote(NoteVal: "C", NoteID: 0, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Cbass2-1")!)
    var CshTr = StaffNote(NoteVal: "C#", NoteID: 0, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Cshtreble-1-1" )!)
    var CshBa = StaffNote(NoteVal: "C#", NoteID: 0, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Cshbass1-1")!)
    
    var DnoteTr = StaffNote(NoteVal: "D", NoteID: 2, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Dtreble-1-1")!)
    var DnoteBa = StaffNote(NoteVal: "D", NoteID: 2, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Dbass1-1")!)
    var DshTr = StaffNote(NoteVal: "D", NoteID: 2, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Dshtreble-1-1")!)
    var DshBa = StaffNote(NoteVal: "D", NoteID: 2, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Dshbass1-1")!)
    
    var EnoteTr = StaffNote(NoteVal: "E", NoteID: 4, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Etreble-1-1")!)
    var EnoteBa = StaffNote(NoteVal: "E", NoteID: 4, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Ebass2-1")!)
    var EflTr = StaffNote(NoteVal: "E", NoteID: 4, natShaFla: accidental(rawValue: 2)!, image: UIImage(named: "Efltreble-1-1")!)
    var EflBa = StaffNote(NoteVal: "E", NoteID: 4, natShaFla: accidental(rawValue: 2)!, image: UIImage(named: "Eflbass1-1")!)
    
    var FnoteTr = StaffNote(NoteVal: "F", NoteID: 5, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Ftreble-1-1")!)
    var FnoteBa = StaffNote(NoteVal: "F", NoteID: 5, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Fbass1-1")!)
    var FshTr = StaffNote(NoteVal: "F", NoteID: 5, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Fshtreble-1-1")!)
    var FshBa = StaffNote(NoteVal: "F", NoteID: 5, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Fshbass1-1")!)
    
    var GnoteTr = StaffNote(NoteVal: "G", NoteID: 7, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Gtreble-1-1")!)
    var GnoteBa = StaffNote(NoteVal: "G", NoteID: 7, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Gbass2-1")!)
    var GshTr = StaffNote(NoteVal: "G", NoteID: 7, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Gshtreble-1-1")!)
    var GshBa = StaffNote(NoteVal: "G", NoteID: 7, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Gshbass1-1")!)
    var GflTr = StaffNote(NoteVal: "G", NoteID: 7, natShaFla: accidental(rawValue: 2)!, image: UIImage(named: "Gfltreble-1-1")!)
    var GflBa = StaffNote(NoteVal: "G", NoteID: 7, natShaFla: accidental(rawValue: 2)!, image: UIImage(named: "Gflbass1-1")!)
    
    var AnoteTr = StaffNote(NoteVal: "A", NoteID: 9, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Atreble-1-1")!)
    var AnoteBa = StaffNote(NoteVal: "A", NoteID: 9, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Abass1-1")!)
    var AshTr = StaffNote(NoteVal: "A", NoteID: 9, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Ashtreble-1-1")!)
    var AshBa = StaffNote(NoteVal: "A", NoteID: 9, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Ashbass1-1")!)
    var AflTr = StaffNote(NoteVal: "A", NoteID: 9, natShaFla: accidental(rawValue: 2)!, image: UIImage(named: "Afltreble-1-1")!)
    var AflBa = StaffNote(NoteVal: "A", NoteID: 9, natShaFla: accidental(rawValue: 2)!, image: UIImage(named: "Aflbass1-1")!)
    
    var BnoteTr = StaffNote(NoteVal: "B", NoteID: 11, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Btreble-1-1")!)
    var BnoteBa = StaffNote(NoteVal: "B", NoteID: 11, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Bbass1-1")!)
    var BflTr = StaffNote(NoteVal: "B", NoteID: 11, natShaFla: accidental(rawValue: 2)!, image: UIImage(named: "Bfltreble-1-1")!)
    var BflBa = StaffNote(NoteVal: "B", NoteID: 11, natShaFla: accidental(rawValue: 2)!, image: UIImage(named: "Bflbass1-1")!)
    
    
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
    
    
    //Linked view objects
    @IBOutlet weak var staffImage: UIImageView!
    @IBOutlet weak var staffSelector: UISegmentedControl!
    
    @IBOutlet weak var Abutton: UIButton!
    @IBOutlet weak var Bbutton: UIButton!
    @IBOutlet weak var Cbutton: UIButton!
    @IBOutlet weak var Dbutton: UIButton!
    @IBOutlet weak var Ebutton: UIButton!
    @IBOutlet weak var Fbutton: UIButton!
    @IBOutlet weak var Gbutton: UIButton!
    
    @IBOutlet weak var lifeLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var livesText: UILabel!
    
    //Answer Buttons
    @IBAction func Answer(_ sender: Any) {
        
        if (sender as AnyObject).tag == trebleNotes[randsel].NoteID{
            print("Right")
            score += 1
            print("Score: ", score)
        }
        else{
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
    
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
    }
    
    
    override func viewDidLoad() {
        initStaffNotes()
        accidCheck()        // Check on load if sharp or flat is displayed
        initGame()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    func initStaffNotes(){
        //Add Treble notes to the array
        trebleNotes.append(AnoteTr)
        trebleNotes.append(BnoteTr)
        trebleNotes.append(CnoteTr)
        trebleNotes.append(DnoteTr)
        trebleNotes.append(EnoteTr)
        trebleNotes.append(FnoteTr)
        trebleNotes.append(GnoteTr)
        //Add sharps & flats
        trebleNotes.append(AshTr)
        trebleNotes.append(AflTr)
        trebleNotes.append(BflTr)
        trebleNotes.append(CshTr)
        trebleNotes.append(DshTr)
        trebleNotes.append(EflTr)
        trebleNotes.append(FshTr)
        trebleNotes.append(GshTr)
        trebleNotes.append(GflTr)
        //Add Bass notes to the array
        bassNotes.append(AnoteBa)
        bassNotes.append(BnoteBa)
        bassNotes.append(CnoteBa)
        bassNotes.append(DnoteBa)
        bassNotes.append(EnoteBa)
        bassNotes.append(FnoteBa)
        bassNotes.append(GnoteBa)
        //add sharps & flats
        bassNotes.append(AshBa)
        bassNotes.append(AflBa)
        bassNotes.append(BflBa)
        bassNotes.append(CshBa)
        bassNotes.append(DshBa)
        bassNotes.append(EflBa)
        bassNotes.append(FshBa)
        bassNotes.append(GshBa)
        bassNotes.append(GflBa)
    }
    
    
    func imgSwitcher(){ //Used to switch the image associated with the Note variable
           if (!hasSwitched){
                CnoteTr.image = UIImage(named: "Ctreble-2-1")
                CnoteBa.image = UIImage(named: "Cbass1-1")
                DnoteTr.image = UIImage(named: "Dtreble-2-1")
                EnoteTr.image = UIImage(named: "Etreble-2-1")
                EnoteBa.image = UIImage(named: "Ebass-1")
                FnoteBa.image = UIImage(named: "Fbass2-1")
                GnoteTr.image = UIImage(named:"Gtreble-2-1")
                GnoteBa.image = UIImage(named: "Gbass1-1")
                AnoteBa.image = UIImage(named: "Abass2-1")
                BnoteBa.image = UIImage(named: "Bbass2-1")
                hasSwitched = true
            }
            else{
                CnoteTr.image = UIImage(named: "Ctreble-1-1")
                CnoteBa.image = UIImage(named: "Cbass2-1")
                DnoteTr.image = UIImage(named: "Dtreble-1-1")
                EnoteTr.image = UIImage(named: "Etreble-1-1")
                EnoteBa.image = UIImage(named: "Ebass-2-1")
                FnoteBa.image = UIImage(named: "Fbass1-1")
                GnoteTr.image = UIImage(named:"Gtreble-1-1")
                GnoteBa.image = UIImage(named: "Gbass2-1")
                AnoteBa.image = UIImage(named: "Abass1-1")
                BnoteBa.image = UIImage(named: "Bbass1-1")
                hasSwitched = false
            }
    }
    
    func highScoreUpdate() {
        
        if(score > highscore){
            highscore = score
            //highscorelbl.Text = highscore
        }
    }
    
    func accidCheck(){
            var trebAccVal = trebleNotes[randsel].nsf.rawValue
            var bassAccVal = bassNotes[randsel].nsf.rawValue
        
        if( (trebAccVal == 1) || (bassAccVal == 1) ){//Sharp
            Abutton.setTitle("A"+sharpSym, for: .normal)
            Cbutton.setTitle("C"+sharpSym, for: .normal)
            Dbutton.setTitle("D"+sharpSym, for: .normal)
            Fbutton.setTitle("F"+sharpSym, for: .normal)
            Gbutton.setTitle("G"+sharpSym, for: .normal)
        }
        else if( (trebAccVal == 2) || (bassAccVal == 2) ){//Flat
            Abutton.setTitle("A"+flatSym, for: .normal)
            Bbutton.setTitle("B"+flatSym, for: .normal)
            Dbutton.setTitle("D"+flatSym, for: .normal)
            Ebutton.setTitle("E"+flatSym, for: .normal)
            Gbutton.setTitle("G"+flatSym, for: .normal)
            
        }
        else{   //Reset to default label
            Abutton.setTitle("A", for: .normal)
            Bbutton.setTitle("B", for: .normal)
            Cbutton.setTitle("C", for: .normal)
            Dbutton.setTitle("D", for: .normal)
            Ebutton.setTitle("E", for: .normal)
            Fbutton.setTitle("F", for: .normal)
            Gbutton.setTitle("G", for: .normal)
        }
        
    }
    
    func initGame(){
        if (!gameMode){
            livesText.isHidden = true
            lifeLbl.isHidden = true
            lifecount = -1
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





