/*
 * Copyright (c) 2016 Tim van Elsloo
 * Copyright (c) 2015 Comyar Zaheri.
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

import AudioKit
import Foundation

protocol TunerDelegate {
    /* Allows Tuner.swift to send audio metrics to other Swift objects */
    func tunerDidMeasure(pitch: Pitch, distance: Double, amplitude: Double)
}

class Tuner: NSObject {
    var delegate: TunerDelegate?

    /* Private instance variables. */
    fileprivate var timer:      Timer?
    fileprivate let microphone: AKMicrophone
    fileprivate let tracker:   AKFrequencyTracker
    fileprivate let silence:    AKBooster
    fileprivate let threshold: Double
    fileprivate let smoothing: Double
    fileprivate var smoothingBuffer: [Double] = []
    fileprivate let smoothingBufferCount = 30
    
    override init() {
        microphone = AKMicrophone()
        tracker = AKFrequencyTracker(microphone)
        silence = AKBooster(tracker, gain: 0)
        threshold = 0.05
        smoothing = 0.25
    }

    func startMonitoring() {
        /* Start the microphone and analyzer. */
        tracker.start()
        microphone.start()
        AudioKit.output = silence
        
        do
        {
            try AudioKit.start()
        }
        catch
        {
            AKLog("AudioKit did not start!")
        }
        
        /* Initialize and schedule a new run loop timer.*/
        timer = Timer.scheduledTimer(timeInterval: 0.03, target: self,
                                                       selector: #selector(Tuner.tick),
                                                       userInfo: nil,
                                                       repeats: true)
    }

    func stopMonitoring() {
        tracker.stop()
        microphone.stop()
        timer?.invalidate()
    }
    
    /**
     Exponential smoothing:
     https://en.wikipedia.org/wiki/Exponential_smoothing
     */
    fileprivate func smooth(_ value: Double) -> Double {
        var frequency = value
        if smoothingBuffer.count > 0 {
            let last = smoothingBuffer.last!
            frequency = (smoothing * value) + (1.0 - smoothing) * last
            if smoothingBuffer.count > smoothingBufferCount {
                smoothingBuffer.removeFirst()
            }
        }
        smoothingBuffer.append(frequency)
        return frequency
    }
    
    @objc func tick() {
        /* Read frequency and amplitude from the analyzer. */
        var amplitude = tracker.amplitude
        var frequency = tracker.amplitude
        
        if (amplitude > threshold)
        {
            amplitude = tracker.amplitude
            frequency = smooth(tracker.frequency)
        }
        else
        {
            amplitude = 0.0
        }
        
        /* Find nearest pitch. */
        let pitch = Pitch.nearest(frequency)
        
        /* Calculate the distance. */
        let distance = frequency - pitch.frequency

        /* Call the delegate. */
        self.delegate?.tunerDidMeasure(pitch: pitch, distance: distance,
                                            amplitude: amplitude)
    }
}
