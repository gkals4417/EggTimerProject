//
//  RareViewController.swift
//  EggTimerProject
//
//  Created by Hamin Jeong on 2022/06/09.
//

import UIKit
import AVFoundation

class RareViewController: UIViewController {

    @IBOutlet weak var rareTimeLabel: UILabel!
    @IBOutlet weak var rareTimeButton: UIButton!
    @IBOutlet weak var rareTimeResetButton: UIButton!
    @IBOutlet weak var rareProgressBar: UIProgressView!
    @IBOutlet weak var rareTimePauseButton: UIButton!
    @IBOutlet weak var rareProgressLabel: UILabel!
    
    
    
    var timer: Timer?
    var timeNumber: Int = 390
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    func setupUI(){
        title = "완전반숙"
        
        view.backgroundColor = .lightGray
        
        rareTimeLabel.text = "시작버튼을 누르세요."
        rareTimeLabel.textColor = .black
        
        rareProgressLabel.text = ""
        rareProgressLabel.textColor = .black
        
        rareTimeButton.setTitle("시작", for: .normal)
        rareTimeButton.setTitleColor(.black, for: .normal)
        rareTimeButton.backgroundColor = .clear
        
        rareTimeResetButton.setTitle("리셋", for: .normal)
        rareTimeResetButton.setTitleColor(.black, for: .normal)
        rareTimeResetButton.backgroundColor = .clear
        
        rareTimePauseButton.setTitle("일시정지", for: .normal)
        rareTimePauseButton.setTitleColor(.black, for: .normal)
        rareTimePauseButton.backgroundColor = .clear
        
        rareProgressBar.progressViewStyle = .default
        //rareProgressBar.transform = rareProgressBar.transform.scaledBy(x: 1, y: 10)
        rareProgressBar.progress = 0.0
        rareProgressBar.tintColor = .darkGray
        rareProgressBar.backgroundColor = .white
        rareProgressBar.layer.cornerRadius = 5
        rareProgressBar.clipsToBounds = true
        rareProgressBar.layer.sublayers![1].cornerRadius = 5
        rareProgressBar.subviews[1].clipsToBounds = true
    }
    
    @IBAction func rareTimeButtonTapped(_ sender: UIButton) {
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
    
    
    @IBAction func rareTimeResetButtonTapped(_ sender: UIButton) {
        
        timer?.invalidate()
        timeNumber = 390
        rareProgressBar.setProgress(0.0, animated: true)
        rareTimeLabel.text = "시작버튼을 누르세요."
        rareProgressLabel.text = ""
        
    }
    

    @IBAction func rareTimePauseButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
    }
    

    
}
