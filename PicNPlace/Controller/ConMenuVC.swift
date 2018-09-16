//
//  ConMenuVC.swift
//  PicNPlace
//
//  Created by stone_1 on 28/08/2018.
//  Copyright © 2018 stone1. All rights reserved.
//

import UIKit
import ContextMenu

class ConMenuVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var projectsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        projectsTable.dataSource = self
//        projectsTable.delegate = self
//        
        title = "Hannah smells!"
        preferredContentSize = CGSize(width: 200, height: 300)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getProjects().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell") as? ProjectCell {
            let project = DataService.instance.getProjects()[indexPath.row]
            cell.updateViews(project: project)
            return cell
        } else {
            return ProjectCell()
        }
    }
}
