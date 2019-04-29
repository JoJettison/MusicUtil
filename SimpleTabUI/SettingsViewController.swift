//
//  SettingsViewController.swift
//  MusicUtil
//
//  Created by Emily Knowles on 4/2/19.
//  Copyright © 2019 Joseph. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //Linked view objects for settings
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var keySwitch: UISwitch!
    @IBOutlet weak var gameSwitch: UISwitch!
    @IBOutlet weak var lifeSlider: UISlider!
    @IBOutlet weak var sliderVal: UILabel!
    @IBOutlet weak var keyInputLbl: UILabel!
    @IBOutlet weak var gameModeLbl: UILabel!
    @IBOutlet weak var lifeLbl: UILabel!
    @IBOutlet weak var aboutLbl: UILabel!
    @IBOutlet weak var legalBox: UITextView!

    
    //Called when the view is first loaded, initializes the controller
    override func viewDidLoad() {
        
        let museTab = tabBarController as! MuseTabBarController
        //Reference to the tabbar controller for the app
        if keySwitch.isOn{  //Check for keyboard view
            museTab.keyView = true
            print("Keyboardview on")
        }
        else{
            museTab.keyView = false
            print("Keyboardview off")
        }
        
        if gameSwitch.isOn{ // check for game mode
            museTab.gameMode = true
            print("gameplay enabled")
        }
        else{
            museTab.gameMode = false
        }
        museTab.lifeNum = Int(lifeSlider.value)
        aboutLbl.isHidden = true
        legalBox.isHidden = true
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //Called when the view is about to be displayed
    override func viewWillAppear(_ animated: Bool) {
        let museTab = tabBarController as! MuseTabBarController
        //Reference to the tabbar controller for the app
        if keySwitch.isOn{  //Check for keyboard view
            museTab.keyView = true
            print("Keyboardview on")
        }
        else{
            museTab.keyView = false
            print("Keyboardview off")
        }
        
        if gameSwitch.isOn{ // check for game mode
            museTab.gameMode = true
            print("gameplay enabled")
        }
        else{
            museTab.gameMode = false
        }
        museTab.lifeNum = Int(lifeSlider.value)
    }
    
    //Called as the view is being displayed
    override func viewDidAppear(_ animated: Bool) {
        let museTab = tabBarController as! MuseTabBarController
        //Reference to the tabbar controller for the app
        if keySwitch.isOn{  //Check for keyboard view
            museTab.keyView = true
            print("Keyboardview on")
        }
        else{
            museTab.keyView = false
            print("Keyboardview off")
        }
        
        if gameSwitch.isOn{ // check for game mode
            museTab.gameMode = true
            print("gameplay enabled")
        }
        else{
            museTab.gameMode = false
        }
        museTab.lifeNum = Int(lifeSlider.value)
    }
    //Called as the view is no longer being displayed
    override func viewDidDisappear(_ animated: Bool) {
        let museTab = tabBarController as! MuseTabBarController
        //Reference to the tabbar controller for the app
        if keySwitch.isOn{  //Check for keyboard view
            museTab.keyView = true
            print("Keyboardview on")
        }
        else{
            museTab.keyView = false
            print("Keyboardview off")
        }
        
        if gameSwitch.isOn{ // check for game mode
            museTab.gameMode = true
            print("gameplay enabled")
        }
        else{
            museTab.gameMode = false
        }
        museTab.lifeNum = Int(lifeSlider.value)
    }
    
    //Update life value visually when slider is used
    @IBAction func lifeValChanged(_ sender: UISlider) {
        let currentVal = Int(sender.value)
        
        sliderVal.text = "\(currentVal)"
    }
    
    //Disable slider if game mode is offf
    @IBAction func gameModeSwitched(_ sender: UISwitch) {
        if(sender.isOn){
            lifeSlider.isEnabled = true
        }
        else{
            lifeSlider.isEnabled = false
        }
    }
    //Selection switch for the three elements that are on screen
    @IBAction func settingsSelection(_ sender: UISegmentedControl) {
        
        switch(sender.selectedSegmentIndex){
        case 0: // Settings
        //TODO Hide view objects for the legal and resources tab
            
        //BEGIN [SHOW] SETTINGS ELEMENTS
            gameModeLbl.isHidden = false
            gameSwitch.isHidden = false
            keyInputLbl.isHidden = false
            keySwitch.isHidden = false
            lifeSlider.isHidden = false
            lifeLbl.isHidden = false
            sliderVal.isHidden = false
        //END [SHOW] SETTINGS ELEMENTS
            
        //BEGIN [HIDE] RESOURCE ELEMENTS
        //END [HIDE] RESOURCE ELEMENTS
            
        //BEGIN [HIDE] LEGAL ELEMENTS
            legalBox.isHidden = true
            aboutLbl.isHidden = true
        //END [HIDE] LEGAL ELEMENTS
            
        case 1: // Resources
            gameModeLbl.isHidden = true
            gameSwitch.isHidden = true
            keyInputLbl.isHidden = true
            keySwitch.isHidden = true
            lifeSlider.isHidden = true
            lifeLbl.isHidden = true
            sliderVal.isHidden = true
            legalBox.isHidden = true
            aboutLbl.isHidden = true
            
        case 2: // Legal
            //BEGIN [HIDE] SETTINGS ELEMENTS
            gameModeLbl.isHidden = true
            gameSwitch.isHidden = true
            keyInputLbl.isHidden = true
            keySwitch.isHidden = true
            lifeSlider.isHidden = true
            lifeLbl.isHidden = true
            sliderVal.isHidden = true
            //END [HIDE] SETTINGS ELEMENTS
            
            //BEGIN [SHOW] LEGAL ELEMENTS
            legalBox.isHidden = false
            aboutLbl.isHidden = false
            //END [SHOW] LEGAL ELEMENTS
            
         
        default:
            gameModeLbl.isHidden = false
            gameSwitch.isHidden = false
            keyInputLbl.isHidden = false
            keySwitch.isHidden = false
            lifeSlider.isHidden = false
            lifeLbl.isHidden = false
            sliderVal.isHidden = false
        }
    }
}
