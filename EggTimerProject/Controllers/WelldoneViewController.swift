//
//  WelldoneViewController.swift
//  EggTimerProject
//
//  Created by Hamin Jeong on 2022/06/09.
//

import UIKit
import AVFoundation

class WelldoneViewController: UIViewController {

    @IBOutlet weak var welldoneTimeLabel: UILabel!
    @IBOutlet weak var welldoneTimeButton: UIButton!
    @IBOutlet weak var welldoneTimeResetButton: UIButton!
    @IBOutlet weak var welldoneProgressBar: UIProgressView!
    @IBOutlet weak var welldoneTimePauseButton: UIButton!
    @IBOutlet weak var welldoneProgressLabel: UILabel!
    
    
    
    
    var timer: Timer?
    var timeNumber: Int = 720
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        title = "Welldone"
        
        view.backgroundColor = .lightGray
        
        welldoneTimeLabel.text = "시작버튼을 누르세요."
        welldoneTimeLabel.textColor = .black
        
        welldoneProgressLabel.text = ""
        welldoneProgressLabel.textColor = .black
        
        welldoneTimeButton.setTitle("시작", for: .normal)
        welldoneTimeButton.setTitleColor(.black, for: .normal)
        welldoneTimeButton.backgroundColor = .clear
        
        welldoneTimeResetButton.setTitle("리셋", for: .normal)
        welldoneTimeResetButton.setTitleColor(.black, for: .normal)
        welldoneTimeResetButton.backgroundColor = .clear
        
        welldoneTimePauseButton.setTitle("일시정지", for: .normal)
        welldoneTimePauseButton.setTitleColor(.black, for: .normal)
        welldoneTimePauseButton.backgroundColor = .clear
        
        welldoneProgressBar.progressViewStyle = .bar
        welldoneProgressBar.transform = welldoneProgressBar.transform.scaledBy(x: 1, y: 10)
        welldoneProgressBar.progress = 1.0
    }
    
    @IBAction func welldoneTimeButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] _ in
            if timeNumber != 0 {
                timeNumber -= 1
                let progressNumber: Float = Float(timeNumber) / 720
                welldoneTimeLabel.text = "\(timeNumber / 60)분 \(timeNumber % 60)초 남았습니다."
                welldoneProgressBar.setProgress((1 - progressNumber), animated: true)
                welldoneProgressLabel.text = "\((1 - progressNumber) * 100)"
            } else {
                timer?.invalidate()
                welldoneTimeLabel.text = "완료되었습니다!"
                AudioServicesPlayAlertSound(SystemSoundID(1304))
                welldoneProgressBar.setProgress(0.0, animated: true)
            }
        })
        
    }
    @IBAction func welldoneTimeResetButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        timeNumber = 720
        welldoneTimeLabel.text = "시작버튼을 누르세요."
        welldoneProgressBar.setProgress(0.0, animated: true)
        welldoneProgressLabel.text = ""
    }
    
    @IBAction func welldoneTimePauseButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
    }
}
