//
//  SecondScreen.swift
//  StopWatch
//
//  Created by Baudunov Rapkat on 2/4/20.
//  Copyright © 2020 Baudunov Rapkat. All rights reserved.
//

import UIKit

class SecondScreen: UIViewController {
    
    var seconds = 30
    var timer = Timer()
    
    
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    
    @IBOutlet weak var playOutlet: UIButton!
    @IBOutlet weak var pauseOutlet: UIButton!
    @IBOutlet weak var stopOutlet: UIButton!
    
    @IBAction func slider(_ sender: UISlider) {
        seconds = Int(sender.value)
        labelTime.text = String(seconds)
        
    }
    
    @IBAction func buttonStart(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SecondScreen.updateTimer), userInfo: nil, repeats: true)
        
        playOutlet.isEnabled = false
        pauseOutlet.isEnabled = true
        stopOutlet.isEnabled = true
    }
    
    @IBAction func buttonPause(_ sender: Any) {
        timer.invalidate()
        playOutlet.isEnabled = true
        pauseOutlet.isEnabled = false
        stopOutlet.isEnabled = true
    }
    @IBAction func buttonStop(_ sender: Any) {
        timer.invalidate()
        seconds = 30
        slider.setValue(30, animated: true)
        labelTime.text = String(seconds)
        
        playOutlet.isEnabled = true
        pauseOutlet.isEnabled = true
        stopOutlet.isEnabled = false
    }
    @objc func updateTimer(){
        
        seconds -= 1
        labelTime.text = String(seconds)
        
        if seconds == 0 {
            timer.invalidate()
        }
        
    }
}
