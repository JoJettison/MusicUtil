//
//  StaffNote.swift
//  SimpleTabUI
//
//  Created by Joseph on 2/23/19.
//  Copyright © 2019 Joseph. All rights reserved.
//

import Foundation
import UIKit.UIImage

enum accidental: Int { case Natural = 0, Sharp = 1, Flat = 2 }

class StaffNote{
    //Variables
    var image: UIImage?
    var nsf: accidental
    var NoteVal: String?
    var NoteID: Int?
    
    //initializer
    init(NoteVal: String, NoteID: Int, natShaFla: accidental, image:UIImage) {
        self.image = image
        self.NoteVal = NoteVal
        self.NoteID = NoteID
        self.nsf = natShaFla
        
    }
    
}
