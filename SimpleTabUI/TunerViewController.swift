//
//  FirstViewController.swift
//  SimpleTabUI
//
//  Created by Joseph on 2/13/19.
//  Copyright © 2019 Joseph. All rights reserved.
//

import AudioKit
import UIKit

class FirstViewController: UIViewController, TunerDelegate {
    let tuner       = Tuner()
    let displayView = DisplayView()
    let knobView    = KnobView(frame: CGRect(x: 0, y: 0, width: 245, height: 245))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Update the background color. */
        self.view.backgroundColor = UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0)
        
        /* Setup the display view. */
        displayView.frame = CGRect(
            origin: CGPoint(x: round(self.view.bounds.width - 141)  / 2,
                            y: round(self.view.bounds.height - 141) / 2),
            size:   CGSize(width: 141, height: 141)
        )
        self.view.addSubview(displayView)
        
        /* Setup the knob view. */
        knobView.frame = CGRect(
            origin: CGPoint(x: round(self.view.bounds.width - 245) / 2,
                            y: round(self.view.bounds.height - 245) / 2),
            size:   CGSize(width: 245, height: 245)
        )
        self.view.addSubview(knobView)
        
        /* Start the tuner. */
        tuner.delegate = self
        tuner.startMonitoring()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .default
    }
    
    func tunerDidMeasure(pitch: Pitch, distance: Double, amplitude: Double) {
        /* Scale the amplitude to make it look more dramatic. */
        displayView.amplitude = min(1.0, amplitude * 25.0)
        displayView.frequency = pitch.frequency
        
        if amplitude < 0.01 {
            return
        }
        
        knobView.pitch = pitch
        
        /* Calculate the difference between the nearest pitch and the second
         * nearest pitch to express the distance in a percentage. */
        let previous   = pitch - 1
        let next       = pitch + 1
        let difference = distance < 0 ?
            (pitch.frequency - previous.frequency) :
            (next.frequency  - pitch.frequency)
        
        knobView.distance = distance / difference / 2.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
