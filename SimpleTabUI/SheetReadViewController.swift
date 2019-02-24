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
//    var imageSel = ""
//    var Trb = "Treble"
//    var Bss = "Bass"
    var randsel = Int.random(in: 0...4)
    var trebleImg: [UIImage] = []
    var bassImg: [UIImage] = []
    var grandImg: [UIImage] = []
    
    //Linked view objects
    @IBOutlet weak var staffImage: UIImageView!
    @IBOutlet weak var staffSelector: UISegmentedControl!
    
    @IBAction func staffChange(_ sender: UISegmentedControl) {
        randsel = Int.random(in: (0...trebleImg.count))
        
        if staffSelector.selectedSegmentIndex == 0{
            trebleImg.append(UIImage(named: "Atreble-1-1")!)
            trebleImg.append(UIImage(named: "Btreble-1-1")!)
            trebleImg.append(UIImage(named: "Ctreble-2-1-1")!)
            trebleImg.append(UIImage(named: "Dtreble-2-1")!)
            trebleImg.append(UIImage(named: "Etreble2-1-1")!)
            staffImage.image =  trebleImg[randsel]
            
        } else if (staffSelector.selectedSegmentIndex == 1) {
            bassImg.append(UIImage(named: "Abass1-1.png")!)
            bassImg.append(UIImage(named: "Abass2-1.png")!)
            bassImg.append(UIImage(named: "Bbass1-1.png")!)
            bassImg.append(UIImage(named: "Cbass1-1.png")!)
            bassImg.append(UIImage(named: "Ebass2-1.png")!)
            staffImage.image = bassImg[randsel]
            
        }  else{
            
            staffImage.image = UIImage(named: "FullStaff")
            
        }
        
    }
    override func viewDidLoad() {
        initStaffImages()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func initStaffImages(){
        
        if let path = Bundle.main.resourcePath {    //Access asset bundle
            let imagePath = path   //location of images
            let url = NSURL(fileURLWithPath: imagePath)
            let imgfileManager = FileManager.default
            //idk what this does yet
            let properties = [URLResourceKey.localizedNameKey, URLResourceKey.creationDateKey,URLResourceKey.localizedTypeDescriptionKey]
            
            do{
                //load all filenames into an array?
                let imageURLs = try imgfileManager.contentsOfDirectory(at: url as URL, includingPropertiesForKeys: properties, options: FileManager.DirectoryEnumerationOptions.skipsHiddenFiles )
                
                print("image URLs \(imageURLs)")
                
                //error handling
            } catch let error as NSError{
                print (error.description)
            }
           
        }
    }
    func newQuestion(){
        
    }
   
  }





