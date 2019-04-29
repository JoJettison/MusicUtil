//
//  Metronome.swift
//  MusicUtil
//
//  Created by Marcus Maldonado on 4/26/19.
//  Copyright © 2019 Joseph. All rights reserved.
//

import Foundation
import AVFoundation

protocol MetronomeDelegate
{
    func metroMeasure(interval: Double)
}

class Metronome: NSObject {
    var delegate: MetronomeDelegate?
    fileprivate var timer:      Timer?
    fileprivate var interval:   Double = 0.0
    var tock = AVAudioPlayer()
    let soundtock = Bundle.main.path(forResource: "tock", ofType: "wav")
    
    func startMetronome(bpm: Int)
    {
        interval = calcInterval(bpm: bpm)
        do
        {
            tock = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundtock!))
        }
        catch
        {
            print ("Error with sound system")
        }
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        
    }
    
    func calcInterval(bpm: Int) -> Double
    {
        return (1.0/(Double(bpm)/60.0))
    }
    
    func stopMetronome()
    {
        timer?.invalidate()
    }
    
    func isRunning() -> Bool?
    {
        return timer?.isValid
    }
    
    @objc func tick() {
        tock.play()
        self.delegate?.metroMeasure(interval: interval)
    }
}
