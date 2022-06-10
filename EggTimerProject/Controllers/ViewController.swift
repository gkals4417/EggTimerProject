//
//  ViewController.swift
//  EggTimerProject
//
//  Created by Hamin Jeong on 2022/06/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var rareButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var welldoneButton: UIButton!
    
    weak var timer: Timer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naviSetup()
        setupUI()
        
    }
    
    func setupUI(){
        view.backgroundColor = .lightGray
        mainLabel.text = "선택하세요."
        mainLabel.textColor = .black
        
        rareButton.setTitle("Rare", for: .normal)
        rareButton.setTitleColor(.black, for: .normal)
        rareButton.backgroundColor = .clear
        
        mediumButton.setTitle("Medium", for: .normal)
        mediumButton.setTitleColor(.black, for: .normal)
        mediumButton.backgroundColor = .clear
        
        welldoneButton.setTitle("Welldone", for: .normal)
        welldoneButton.setTitleColor(.black, for: .normal)
        welldoneButton.backgroundColor = .clear
    }
    
    func naviSetup(){
        title = "메인메뉴"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .lightGray
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .clear
    }
    
    
    @IBAction func rareButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
    }

    @IBAction func mediumButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
    }
    
    @IBAction func welldoneButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
    }
    
    
}


