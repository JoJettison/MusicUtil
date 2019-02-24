//
//  SheetReadViewController.swift
//  SimpleTabUI
//
//  Created by Joseph on 2/15/19.
//  Copyright © 2019 Joseph. All rights reserved.
//

import UIKit

class SheetReadViewController: UIViewController {
    
    //Variables
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
    var randsel = Int.random(in: (0...6))
    
    var trebleNotes: [StaffNote] = []
    var bassNotes: [StaffNote] = []
    var grandNotes: [StaffNote] = []
    
    //Linked view objects
    @IBOutlet weak var staffImage: UIImageView!
    @IBOutlet weak var staffSelector: UISegmentedControl!
    
    @IBAction func staffChange(_ sender: UISegmentedControl) {
        
        if staffSelector.selectedSegmentIndex == 0{
            randsel = Int.random(in: (0..<trebleNotes.count))
           staffImage.image =  trebleNotes[randsel].image
            print(trebleNotes[randsel].NoteVal!)
            
        } else if (staffSelector.selectedSegmentIndex == 1) {
            randsel = Int.random(in: (0..<bassNotes.count))
           staffImage.image = bassNotes[randsel].image
            print(bassNotes[randsel].NoteVal!)
            
        }  else{
            //randsel = Int.random(in: (0..<grandNotes.count))
            staffImage.image = UIImage(named: "FullStaff")
            
        }
        
    }
    override func viewDidLoad() {
        initStaffNotes()
       // initBassNotes()
        staffImage.image =  trebleNotes[randsel].image
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /*Not Using*/
    
    //    func initStaffImages(){
    //
    //        if let path = Bundle.main.resourcePath {    //Access asset bundle
    //            let imagePath = path   //location of images
    //            let url = NSURL(fileURLWithPath: imagePath)
    //            let imgfileManager = FileManager.default
    //            //idk what this does yet
    //            let properties = [URLResourceKey.localizedNameKey, URLResourceKey.creationDateKey,URLResourceKey.localizedTypeDescriptionKey]
    //
    //            do{
    //                //load all filenames into an array?
    //                let imageURLs = try imgfileManager.contentsOfDirectory(at: url as URL, includingPropertiesForKeys: properties, options: FileManager.DirectoryEnumerationOptions.skipsHiddenFiles )
    //
    //                print("image URLs \(imageURLs)")
    //
    //                //error handling
    //            } catch let error as NSError{
    //                print (error.description)
    //            }
    //
    //        }
    //    }
    
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
    
    func newQuestion(){
    }
   
  }





