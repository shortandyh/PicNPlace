//
//  SecondViewController.swift
//  PicNPlace
//
//  Created by stone_1 on 28/08/2018.
//  Copyright © 2018 stone1. All rights reserved.
//

import UIKit
import CoreData
import ContextMenu

class ProjectsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var addProjView: UIView!

    @IBOutlet weak var addProjTextField: UITextField!
    
    var project = [Projects]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest: NSFetchRequest<Projects> = Projects.fetchRequest()
        
        do {
            let project = try PersistenceService.context.fetch(fetchRequest)
            self.project = project
            self.tableView.reloadData()
        } catch {
            
        }
//        let project = ProjectData()
//        project.image =
        
//        title = "Projects Demo"
//        preferredContentSize = CGSize(width: 300, height: 550)
//        tableView.dataSource = self
//        tableView.delegate = self
    }
    
    @IBAction func addBtn(_ sender: Any) {
    }
    
    @IBAction func onPlusTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Add Project", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Project Name"
        }
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            let name = alert.textFields?.first?.text
//            print(name!)
            let project = Projects(context: PersistenceService.context)
            project.name = name
            PersistenceService.saveContext()
            self.project.append(project)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    func animateIn () {
        //self.view.addSubview(captureImageView)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return project.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = project[indexPath.row].name
        //cell.detailTextLabel?.text = ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            PersistenceService.context.delete(project[indexPath.row])
            project.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            managedObjectContext.delete(sessions[indexPath.row])
//            do {
//                try managedObjectContext.save()
//                tableView.reloadData()
//            } catch let error as NSError {
//                print("Could not save. \(error), \(error.userInfo)")
//            }
//        }
//    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let project = DataService.instance.getProjects()[indexPath.row]
//        performSegue(withIdentifier: "ProjectsVC", sender: project)
//    }
    
    
    
    //Devslopes array
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return DataService.instance.getProjects().count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell") as? ProjectCell {
//            let project = DataService.instance.getProjects()[indexPath.row]
//            cell.updateViews(project: project)
//            return cell
//        } else {
//            return ProjectCell()
//        }
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let project = DataService.instance.getProjects()[indexPath.row]
//        performSegue(withIdentifier: "ProjectsVC", sender: project)
//    }
    
    
    
    
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let productsVC = segue.destination as? ProjectsVC {
//            let barBtn = UIBarButtonItem()
//            barBtn.title = ""
//            navigationItem.backBarButtonItem = barBtn
//            assert(sender as? Project != nil)
//            ProjectsVC.initSnapped(project: sender as! Project)
//            
//            
//        }
//    }
   
    @IBAction func addProjectBtnWasPressed(_ sender: Any) {
    }
    
    
    

}

