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
    fileprivate let analyzer:   AKAudioAnalyzer
    
    /* Public instance variables. */
    public var timerIteration = 0
    public var frequencySample = Array(repeating: 0.0, count: 20)
    public var averageAmplitude = 0.0
    
    override init() {
        /* Start application-wide microphone recording. */
        AKManager.shared().enableAudioInput()

        /* Add the built-in microphone. */
        microphone = AKMicrophone()
        AKOrchestra.add(microphone)

        /* Add an analyzer and store it in an instance variable. */
        analyzer = AKAudioAnalyzer(input: microphone.output)
        AKOrchestra.add(analyzer)
    }

    func startMonitoring() {
        /* Start the microphone and analyzer. */
        analyzer.play()
        microphone.play()

        /* Initialize and schedule a new run loop timer. (Runs 20 times per second) */
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self,
                                                       selector: #selector(Tuner.tick),
                                                       userInfo: nil,
                                                       repeats: true)
    }

    func stopMonitoring() {
        analyzer.stop()
        microphone.stop()
        timer?.invalidate()
    }
    
    func averageAmplitudeCalculation() {
        /* Calculate the average of 20 frequencies */
        averageAmplitude = frequencySample.reduce(0,+)/Double(frequencySample.count)
    }
    
    @objc func tick() {
        /* Read frequency and amplitude from the analyzer. */
        let frequency = Double(analyzer.trackedFrequency.floatValue)
        var amplitude = Double(analyzer.trackedAmplitude.floatValue)
        
        /* Sample 20 frequencies for average calculation */
        timerIteration = timerIteration + 1
        if (timerIteration <= 20)
        {
            frequencySample[timerIteration-1] = amplitude
            if (timerIteration == 20)
            {
                averageAmplitudeCalculation()
                print(averageAmplitude)
                timerIteration = 0
            }
        }
        
        /* Cut off amplitude if it is below threshold */
        if (averageAmplitude < 0.02)
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
