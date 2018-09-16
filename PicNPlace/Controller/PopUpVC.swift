//
//  PopUpVC.swift
//  PicNPlace
//
//  Created by stone_1 on 03/09/2018.
//  Copyright © 2018 stone1. All rights reserved.
//

import UIKit

class PopUpVC: UIViewController {
    
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveToProjects(_ sender: UIButton) {
      
        dismiss(animated: true, completion: nil)
    }
    

}
