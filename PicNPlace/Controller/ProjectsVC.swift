//
//  SecondViewController.swift
//  PicNPlace
//
//  Created by stone_1 on 28/08/2018.
//  Copyright © 2018 stone1. All rights reserved.
//

import UIKit
import CoreData
//import ContextMenu

class ProjectsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var projects = [Projects]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if projects.isEmpty == false {
        
        loadProjects()
        
        }

    }
    
    
    
    func saveProjects() {
        do {
            try context.save()
        } catch {
            print("Error saving project \(error)")
        }
        
        tableView.reloadData()
        
    }
    
    func loadProjects() {
        
        let request : NSFetchRequest<Projects> = Projects.fetchRequest()
        
        do {
            projects = try context.fetch(request)
        } catch {
            print("Error saving project \(error)")
        }
        
        tableView.reloadData()
        
    }
    

    
    
    
    @IBAction func onPlusTapped(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Project", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newProject = Projects(context: self.context)
            newProject.name = textField.text!
            
            self.projects.append(newProject)
            
            self.saveProjects()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Project Name"
            textField = alertTextField
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
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath)
        cell.textLabel?.text = projects[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            self.context.delete(projects[indexPath.row])
            projects.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.saveProjects()
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let newProject = projects[indexPath.row]
//        let project = projects[indexPath.row]
        performSegue(withIdentifier: "SnappedVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let snappedVC = segue.destination as! SnappedVC
//            assert(sender as? Project != nil)
//            snappedVC.initSnapped(project: sender as! Project)
            if let indexPath = tableView.indexPathForSelectedRow {
                snappedVC.selectedProject = projects[indexPath.row]
            }
        
    }
    
    

}

