//
//  CreateGoalVC.swift
//  goalpost-app
//
//  Created by 김영석 on 2018. 10. 4..
//  Copyright © 2018년 김영석. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var goalTextView: UITextView!
    
    var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectColor()
        longTermBtn.setDeselectColor()
       
    }
   
    
    @IBAction func shortTermWasPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.setSelectColor()
        longTermBtn.setDeselectColor()
    }
    
    @IBAction func longTermBtnWasPressed(_ sender: Any) {
        goalType = .longTerm
        shortTermBtn.setDeselectColor()
        longTermBtn.setSelectColor()
    }
    
    
    @IBAction func nextBtnWasPressed(_ sender: Any) {
    }
   
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
        
    }
}
