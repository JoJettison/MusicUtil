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
    
    var keyboardView: Bool = false
    
    override func viewDidLoad() {
        let museTab = tabBarController as! MuseTabBarController
        if keySwitch.isOn{
            museTab.keyView = true
            keyboardView = true
            print("Keyboardview on")
        }
        else{
            museTab.keyView = false
            keyboardView = false
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
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let museTab = tabBarController as! MuseTabBarController
        if keySwitch.isOn{
            museTab.keyView = true
            keyboardView = true
            print("Keyboardview on")
        }
        else{
            museTab.keyView = false
            keyboardView = false
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
            keyboardView = true
            print("Keyboardview on")
        }
        else{
            museTab.keyView = false
            keyboardView = false
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
    
    override func viewDidDisappear(_ animated: Bool) {
        let museTab = tabBarController as! MuseTabBarController
        if keySwitch.isOn{
            museTab.keyView = true
            keyboardView = true
            print("Keyboardview on")
        }
        else{
            museTab.keyView = false
            keyboardView = false
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
    
    
    @IBAction func lifeValChanged(_ sender: UISlider) {
        let currentVal = Int(sender.value)
        
        sliderVal.text = "\(currentVal)"
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
