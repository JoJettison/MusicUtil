//
//  MuseTabBarController.swift
//  MusicUtil
//
//  Created by Joseph on 3/20/19.
//  Copyright © 2019 Joseph. All rights reserved.
//

import UIKit

class MuseTabBarController: UITabBarController {
    
    var keyView: Bool = false
    var gameMode: Bool = false
    var lifeNum: Int = 3
    
    @IBInspectable var  defaultIndex: Int = 2
    

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = defaultIndex
        // Do any additional setup after loading the view.
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
