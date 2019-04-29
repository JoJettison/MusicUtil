//
//  MetronomeViewController.swift
//  MusicUtil
//
//  Created by Marcus Maldonado on 4/26/19.
//  Copyright © 2019 Joseph. All rights reserved.
//

import Foundation
import UIKit

class MetronomeViewController: UIViewController, MetronomeDelegate {
    
    let metronome = Metronome()
    var bpm = 60
    @IBOutlet weak var bpmlbl: UILabel!
    
    
    @IBAction func stepper(_ sender: UIStepper) {
        bpmlbl.text = String(Int(sender.value))
        bpm = Int(sender.value)
        if (metronome.isRunning() ?? false)
        {
            metronome.stopMetronome()
            metronome.startMetronome(bpm: bpm)
        }
    }
    
    @IBAction func onStartClick(_ sender: UIButton) {
        metronome.startMetronome(bpm: bpm)
    }
    
    @IBAction func onStopClick(_ sender: UIButton) {
        metronome.stopMetronome()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        metronome.delegate = self
    }
    
    func metroMeasure(interval: Double) {
        return
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
