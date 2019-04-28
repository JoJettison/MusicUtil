//
//  SettingsViewController.swift
//  MusicUtil
//
//  Created by Emily Knowles on 4/2/19.
//  Copyright © 2019 Joseph. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
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

    
    
    override func viewDidLoad() {
        let museTab = tabBarController as! MuseTabBarController
        if keySwitch.isOn{
            museTab.keyView = true
            print("Keyboardview on")
        }
        else{
            museTab.keyView = false
            print("Keyboardview off")
        }
        
        if gameSwitch.isOn{
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
    
    override func viewWillAppear(_ animated: Bool) {
        let museTab = tabBarController as! MuseTabBarController
        if keySwitch.isOn{
            museTab.keyView = true
            print("Keyboardview on")
        }
        else{
            museTab.keyView = false
            print("Keyboardview off")
        }
        if gameSwitch.isOn{
            museTab.gameMode = true
            print("gameplay enabled")
        }
        else{
            museTab.gameMode = false
        }
         museTab.lifeNum = Int(lifeSlider.value)
    }
    override func viewDidAppear(_ animated: Bool) {
        let museTab = tabBarController as! MuseTabBarController
        if keySwitch.isOn{
            museTab.keyView = true
            print("Keyboardview on")
        }
        else{
            museTab.keyView = false
            print("Keyboardview off")
        }
        if gameSwitch.isOn{
            museTab.gameMode = true
            lifeSlider.isEnabled = true
            print("gameplay enabled")
        }
        else{
            museTab.gameMode = false
            lifeSlider.isEnabled = false
        }
         museTab.lifeNum = Int(lifeSlider.value)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let museTab = tabBarController as! MuseTabBarController
        if keySwitch.isOn{
            museTab.keyView = true
            print("Keyboardview on")
        }
        else{
            museTab.keyView = false
            print("Keyboardview off")
        }
        if gameSwitch.isOn{
            museTab.gameMode = true
            print("gameplay enabled")
            lifeSlider.isEnabled = true
        }
        else{
            museTab.gameMode = false
            lifeSlider.isEnabled = false
        }
        museTab.lifeNum = Int(lifeSlider.value)
    }
    
    
    @IBAction func lifeValChanged(_ sender: UISlider) {
        let currentVal = Int(sender.value)
        
        sliderVal.text = "\(currentVal)"
    }
    
    @IBAction func modeSwitchedGame(_ sender: UISwitch) {
        if(sender.isOn){
            lifeSlider.isEnabled = true
        }
        else{
            lifeSlider.isEnabled = false
        }
    }
    
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
            gameModeLbl.isHidden = true
            gameSwitch.isHidden = true
            keyInputLbl.isHidden = true
            keySwitch.isHidden = true
            lifeSlider.isHidden = true
            lifeLbl.isHidden = true
            sliderVal.isHidden = true
            legalBox.isHidden = false
            aboutLbl.isHidden = false
            
         
        default:
            gameModeLbl.isHidden = false
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
