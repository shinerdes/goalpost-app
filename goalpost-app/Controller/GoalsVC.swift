//
//  GoalsVC.SWIFT
//  goalpost-app
//
//  Created by 김영석 on 2018. 10. 3..
//  Copyright © 2018년 김영석. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
    }

   
    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
        
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else {
            return }
        
    
        presentDetail(viewControllerToPresent: createGoalVC)
    
    
    }
    


}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return UITableViewCell() }
        cell.configureCell(description: "Eat saled twice a week.", type: .shortTerm, goalProgressAmount: 2)
        return cell
    }
}

