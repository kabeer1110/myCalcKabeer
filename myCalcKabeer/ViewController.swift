//
//  ViewController.swift
//  myCalcKabeer
//
//  Created by Kabeer on 3/30/17.
//  Copyright © 2017 Kabeer. All rights reserved.
//

import UIKit
enum modes {
    case not_set
    case addition
    case subtraction

}

class ViewController: UIViewController {
    
    @IBOutlet var calcLabel: UILabel!
    
    var labelString: String = "0"
    var currentMode:modes = .not_set
    var savedNum:Int = 0
    var lastButtonWasMode:Bool = false


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    @IBAction func didPressNumber(_ sender: UIButton) {
        if (lastButtonWasMode){
            lastButtonWasMode = false
            labelString = "0"
        }
        
        let stringValue:String? = sender.titleLabel?.text
        labelString = labelString.appending(stringValue!)
        
        calcLabel.text = labelString
         updateText()
        
    }

    @IBAction func didPressPlus(_ sender: UIButton) {
        changeMode(newMode: .addition)
    }

    @IBAction func didPressClear(_ sender: UIButton) {
        
        labelString = "0"
        currentMode = .not_set
        savedNum = 0
        lastButtonWasMode = false
        updateText()
        
    }
    
    @IBAction func didPressEquals(_ sender: UIButton) {

    }
    
    func updateText(){
        
        guard let calcLabelInt:Int = Int(labelString) else{return}
        if (currentMode == .not_set) {savedNum = calcLabelInt}
        calcLabel.text = "\(calcLabelInt)"
    }
    
    func changeMode(newMode:modes){
        if (savedNum == 0) {return}
        currentMode = newMode
        lastButtonWasMode = true
    }
}

