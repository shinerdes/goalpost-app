//
//  GoalsVC.SWIFT
//  goalpost-app
//
//  Created by 김영석 on 2018. 10. 3..
//  Copyright © 2018년 김영석. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
        
        print("button was pressed")
    }
    
    

}

