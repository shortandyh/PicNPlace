//
//  ProjectCell.swift
//  PicNPlace
//
//  Created by stone_1 on 28/08/2018.
//  Copyright © 2018 stone1. All rights reserved.
//

import UIKit
import ContextMenu

class ProjectCell: UITableViewCell {

    
    @IBOutlet weak var projectDescriptionLbl: UILabel!
//    @IBOutlet weak var projectsTitle: UIView!
    
    func updateViews(project: Projects) {
        projectDescriptionLbl.text = project.name
    }
    
    func configureCell (description: String){
        self.projectDescriptionLbl.text = description
    }
    
}
