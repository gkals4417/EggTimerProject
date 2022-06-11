//
//  Timer.swift
//  EggTimerProject
//
//  Created by Hamin Jeong on 2022/06/10.
//

import UIKit
import AVFoundation

class EggTimer {
    
    func eggTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] _ in
            if timeNumber != 0 {
                timeNumber -= 1
                rareTimeLabel.text = "\(timeNumber / 60)분 \(timeNumber % 60)초 남았습니다."
                let progressNumber: Float = Float(timeNumber) / 390
                rareProgressBar.setProgress((1.0 - progressNumber), animated: true)
                rareProgressLabel.text = "\(Int((1.0 - progressNumber) * 100))%"
            } else {
            timer?.invalidate()
                rareTimeLabel.text = "완료되었습니다!"
                rareProgressBar.setProgress(0.0, animated: true)
                AudioServicesPlayAlertSound(SystemSoundID(1304))
            }
        })
    }
}
