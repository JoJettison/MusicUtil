//
//  SheetReadViewController.swift
//  SimpleTabUI
//
//  Created by Joseph on 2/15/19.
//  Copyright © 2019 Joseph. All rights reserved.
//

import UIKit

class SheetReadViewController: UIViewController {
    
    // Note Variables [Notes are uniquely identified by their NoteID. These match the answer button tags]
    var CnoteTr = StaffNote(NoteVal: "C", NoteID: 0, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Ctreble-1-1")!)
    var CnoteBa = StaffNote(NoteVal: "C", NoteID: 0, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Cbass2-1")!)
    //var CshDflote = StaffNote(NoteVal: "C#|Db", NoteID: 1, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Ctreble1")!)
    var DnoteTr = StaffNote(NoteVal: "D", NoteID: 2, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Dtreble-1-1")!)
    var DnoteBa = StaffNote(NoteVal: "D", NoteID: 2, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Dbass1-1")!)
    //var EflDshnote = StaffNote(NoteVal: "Eb|D#", NoteID: 3, natShaFla: accidental(rawValue: 1!, image: UIImage(named: "Ctreble1")!)
    var EnoteTr = StaffNote(NoteVal: "E", NoteID: 4, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Etreble-1-1")!)
    var EnoteBa = StaffNote(NoteVal: "E", NoteID: 4, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Ebass2-1")!)
    var FnoteTr = StaffNote(NoteVal: "F", NoteID: 5, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Ftreble-1-1")!)
    var FnoteBa = StaffNote(NoteVal: "F", NoteID: 5, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Fbass1-1")!)
    //var FshGflnote = StaffNote(NoteVal: "F#|Gb", NoteID: 6, natShaFla: accidental(rawValue: 1)!, image: UIImage(named: "Ctreble1")!)
    var GnoteTr = StaffNote(NoteVal: "G", NoteID: 7, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Gtreble-1-1")!)
    var GnoteBa = StaffNote(NoteVal: "G", NoteID: 7, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Gbass2-1")!)
    //var AflGshnote = StaffNote(NoteVal: "Ab|G#", NoteID: 8, natShaFla: accidental(rawValue: 2)!, image: UIImage(named: "Ctreble1")!)
    var AnoteTr = StaffNote(NoteVal: "A", NoteID: 9, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Atreble-1-1")!)
    var AnoteBa = StaffNote(NoteVal: "A", NoteID: 9, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Abass1-1")!)
    //var BflAshnote = StaffNote(NoteVal: "Bb|A#", NoteID: 10, natShaFla: accidental(rawValue: 2)!, image: UIImage(named: "Ctreble1")!)
    var BnoteTr = StaffNote(NoteVal: "B", NoteID: 11, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Btreble-1-1")!)
    var BnoteBa = StaffNote(NoteVal: "B", NoteID: 11, natShaFla: accidental(rawValue: 0)!, image: UIImage(named: "Bbass1-1")!)
    
    var randsel = Int.random(in: (0..<7))
    var score = 0
    var cycle = 0
    var hasSwitched = false
    var trebleNotes: [StaffNote] = []
    var bassNotes: [StaffNote] = []
    var grandNotes: [StaffNote] = []
    
    //Linked view objects
    @IBOutlet weak var staffImage: UIImageView!
    @IBOutlet weak var staffSelector: UISegmentedControl!
    @IBOutlet weak var scoreLbl: UILabel!
    
    
    //Answer Buttons
    @IBAction func Answer(_ sender: Any) {
        
        if (sender as AnyObject).tag == trebleNotes[randsel].NoteID{
            print("Right")
            score += 1
            print("Score: ", score)
        }
        else{
            print("Wrong")
            print("Score: ", score)
        }
        
        newQuestion()
    }
    
    
    //Segmented control update
    @IBAction func staffChange(_ sender: UISegmentedControl) {
        
        if staffSelector.selectedSegmentIndex == 0{
            randsel = Int.random(in: (0..<trebleNotes.count))
            staffImage.image =  trebleNotes[randsel].image
            print("Answer: ",trebleNotes[randsel].NoteVal!)
            
        } else if (staffSelector.selectedSegmentIndex == 1) {
            randsel = Int.random(in: (0..<bassNotes.count))
            staffImage.image = bassNotes[randsel].image
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
        //Add Bass notes to the array
        bassNotes.append(AnoteBa)
        bassNotes.append(BnoteBa)
        bassNotes.append(CnoteBa)
        bassNotes.append(DnoteBa)
        bassNotes.append(EnoteBa)
        bassNotes.append(FnoteBa)
        bassNotes.append(GnoteBa)
    }
    
    func imgSwitcher(){
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

    
    func newQuestion(){
        //Display score
        scoreLbl.text = String(score)
        cycle += 1
        //Check which selector is in use
        switch(staffSelector.selectedSegmentIndex){
        case 0:
            randsel = Int.random(in: 0..<trebleNotes.count)
            staffImage.image =  trebleNotes[randsel].image
            print("Answer: ",trebleNotes[randsel].NoteVal!)
        case 1:
            randsel = Int.random(in: 0..<bassNotes.count)
            staffImage.image = bassNotes[randsel].image
            print("Answer: ",bassNotes[randsel].NoteVal!)
        case 2:
             randsel = Int.random(in: 0..<grandNotes.count)
        default:
             randsel = 0
        }
        if(cycle % 5 == 0){
            imgSwitcher()
        }
    }
   
  }





