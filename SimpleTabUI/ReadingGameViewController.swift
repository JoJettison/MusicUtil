//
//  ReadingGameViewController.swift
//  SimpleTabUI
//
//  Created by Joseph on 2/16/19.
//  Copyright © 2019 Joseph. All rights reserved.
//

import UIKit

class ReadingGameViewController: UIViewController {
    
    var imageSel = ""
    var Trb = "Treble"
    var Bss = "Bass"
    
    @IBOutlet weak var staffImage: UIImageView!
    @IBOutlet weak var scoreLbl: UILabel!
    
    
    
    
    override func viewDidLoad() {
        
        if Trb == imageSel{
                
            staffImage.image = UIImage(named: "TrebleStaff")
            
            
        } else if (imageSel ==  Bss) {
            
            staffImage.image = UIImage(named: "BassStaff" )
            
        }  else{
            
            staffImage.image = UIImage(named: "FullStaff")
            
        }
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

