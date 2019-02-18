//
//  SheetReadViewController.swift
//  SimpleTabUI
//
//  Created by Joseph on 2/15/19.
//  Copyright © 2019 Joseph. All rights reserved.
//

import UIKit

class SheetReadViewController: UIViewController {
    
    private let dataSource = ["Treble", "Bass", "Full"]
    @IBOutlet weak var StaffPicker: UIPickerView!
    var selection: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        StaffPicker.dataSource = self
        StaffPicker.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ReadingGameViewController
        destinationVC.imageSel = selection!
    }

}

extension SheetReadViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let value = dataSource[row]
        selection = value
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
}
