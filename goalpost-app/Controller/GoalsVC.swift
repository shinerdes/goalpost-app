//
//  GoalsVC.SWIFT
//  goalpost-app
//
//  Created by 김영석 on 2018. 10. 3..
//  Copyright © 2018년 김영석. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var goals: [Goal] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.fetch { (complete) in
            if complete {
                if goals.count >= 1 {
                    tableView.isHidden = false
                   
                    } else {
                    tableView.isHidden = true
                }
            }
        }
        
        tableView.reloadData()
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
        return goals.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return UITableViewCell() }
        
        let goal = goals[indexPath.row]
        cell.configureCell(goal: goal)
        return cell
    }
}


extension GoalsVC {
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let manageContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        
        do {
            goals = try manageContext.fetch(fetchRequest)
            print("successfully fetched data")
            completion(true)
        } catch {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
        
    }
}
