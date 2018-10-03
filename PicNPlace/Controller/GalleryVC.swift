//
//  GalleryVC.swift
//  PicNPlace
//
//  Created by stone_1 on 28/08/2018.
//  Copyright © 2018 stone1. All rights reserved.
//

import UIKit
//import ContextMenu

class GalleryVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
//    @objc func flip() {
//        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
//
//        UIView.transition(with: firstView, duration: 1.0, options: transitionOptions, animations: {
//            self.firstView.isHidden = true
//        })
//
//        UIView.transition(with: secondView, duration: 1.0, options: transitionOptions, animations: {
//            self.secondView.isHidden = false
//        })
//    }
    
    var firstView: UIView!
    var secondView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        firstView = UIView(frame: CGRect(x: 32, y: 32, width: 128, height: 128))
//        secondView = UIView(frame: CGRect(x: 32, y: 32, width: 128, height: 128))
//
//        firstView.backgroundColor = UIColor.red
//        secondView.backgroundColor = UIColor.blue
//
//        secondView.isHidden = true
//
//        view.addSubview(firstView)
//        view.addSubview(secondView)
//
//        perform(#selector(flip), with: nil, afterDelay: 0.5)
//
        getImage(imageName: "Test.jpg")
        
        imageView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        imageView.addGestureRecognizer(tapGesture)
        tapGesture.numberOfTapsRequired = 1
        
        // Do any additional setup after loading the view.
    }
    
    @objc func tapGesture() {
        if imageView.image == UIImage(named: "Test.jpg") {
            imageView.image = UIImage(named: "Shirt01")
        } else {
            imageView.image = UIImage(named: "Test.jpg")
        }
    }
    
    func getImage(imageName: String) {
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) .appendingPathComponent(imageName)
        if  fileManager.fileExists(atPath: imagePath) {
            imageView.image = UIImage(contentsOfFile: imagePath)
            
            
        } else {
            print("Panic! No Image!")
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
