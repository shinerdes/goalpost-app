//
//  CreateGoalVC.swift
//  goalpost-app
//
//  Created by 김영석 on 2018. 10. 4..
//  Copyright © 2018년 김영석. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {

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
        goalTextView.delegate = self
        
       
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
        if goalTextView.text != "" && goalTextView.text != "What is your goal?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "finishGoalVC") as? FinishGoalVC else { return }
            finishGoalVC.initData(description: goalTextView.text!, type: goalType)
            presentingViewController?.presentSecondaryDetail(finishGoalVC)
        }
    }
   
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
