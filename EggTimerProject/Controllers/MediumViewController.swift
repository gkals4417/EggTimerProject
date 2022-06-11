//
//  MediumViewController.swift
//  EggTimerProject
//
//  Created by Hamin Jeong on 2022/06/09.
//

import UIKit
import AVFoundation

class MediumViewController: UIViewController {

    @IBOutlet weak var mediumTimeLabel: UILabel!
    @IBOutlet weak var mediumTimeButton: UIButton!
    @IBOutlet weak var mediumTimeResetButton: UIButton!
    @IBOutlet weak var mediumProgressBar: UIProgressView!
    @IBOutlet weak var mediumTimePauseButton: UIButton!
    @IBOutlet weak var mediumProgressLabel: UILabel!
    
    
    
    
    var timer: Timer?
    var timeNumber: Int = 510
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        title = "반숙"
        
        view.backgroundColor = .lightGray
        
        mediumTimeLabel.text = "시작버튼을 누르세요."
        mediumTimeLabel.textColor = .black
        
        mediumProgressLabel.text = ""
        mediumProgressLabel.textColor = .black
        
        mediumTimeButton.setTitle("시작", for: .normal)
        mediumTimeButton.setTitleColor(.black, for: .normal)
        mediumTimeButton.backgroundColor = .clear
        
        mediumTimeResetButton.setTitle("리셋", for: .normal)
        mediumTimeResetButton.setTitleColor(.black, for: .normal)
        mediumTimeResetButton.backgroundColor = .clear
        
        mediumTimePauseButton.setTitle("일시정지", for: .normal)
        mediumTimePauseButton.setTitleColor(.black, for: .normal)
        mediumTimePauseButton.backgroundColor = .clear
        
        mediumProgressBar.progressViewStyle = .bar
        //mediumProgressBar.transform = mediumProgressBar.transform.scaledBy(x: 1, y: 10)
        mediumProgressBar.progress = 0.0
        mediumProgressBar.tintColor = .darkGray
        mediumProgressBar.backgroundColor = .white
        mediumProgressBar.layer.cornerRadius = 5
        mediumProgressBar.clipsToBounds = true
        mediumProgressBar.layer.sublayers![1].cornerRadius = 5
        mediumProgressBar.subviews[1].clipsToBounds = true
    }

    @IBAction func mediumTimeButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] _ in
            if timeNumber != 0 {
                timeNumber -= 1
                mediumTimeLabel.text = "\(timeNumber / 60)분 \(timeNumber % 60)초 남았습니다."
                let progressNumber: Float = Float(timeNumber) / 510
                mediumProgressBar.setProgress((1.0 - progressNumber), animated: true)
                mediumProgressLabel.text = "\(Int((1.0 - progressNumber) * 100))%"
            } else {
                timer?.invalidate()
                mediumTimeLabel.text = "완료되었습니다!"
                AudioServicesPlayAlertSound(SystemSoundID(1304))
                mediumProgressBar.setProgress(0.0, animated: true)
            }
        })
    }
    
    @IBAction func mediumTimeResetButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        timeNumber = 510
        mediumTimeLabel.text = "시작버튼을 누르세요."
        mediumProgressBar.setProgress(0.0, animated: true)
        mediumProgressLabel.text = ""
    }
    
    @IBAction func mediumTimePauseButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
    }
    
}
