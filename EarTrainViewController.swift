//
//  SecondViewController.swift
//  SimpleTabUI
//
//  Created by Joseph on 2/13/19.
//  Copyright © 2019 Joseph. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let questions = ["Answer = A", "Answer = B", "Answer = C", "Answer = D", "Answer = E", "Answer = F", "Answer = G"]
    let buttonTitles = ["A", "B", "C", "D", "E", "F", "G"]
    let answers = ["A", "B", "C", "D", "E", "F", "G"]
    
    //Variables
    var currentQuestion = 0
    
    //Label
    @IBOutlet weak var lbl: UILabel!
    
    //Button
    @IBAction func Action(_ sender: Any)
    {
        if ((sender as AnyObject).tag == Int(currentQuestion)-1)
        {
            print(currentQuestion)
            print("Right")
        }
        else
        {
            print(currentQuestion)
            print("Wrong")
        }
        
        if (currentQuestion != questions.count)
        {
            newQuestion()
        }
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        newQuestion()
    }
    
    func newQuestion()
    {
        lbl.text = questions[currentQuestion]
        
        currentQuestion += 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

