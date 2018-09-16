//
//  FirstViewController.swift
//  PicNPlace
//
//  Created by stone_1 on 28/08/2018.
//  Copyright © 2018 stone1. All rights reserved.
//

import UIKit
import AVFoundation
import ContextMenu
import CoreData

class CameraVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    //Variables
    var captureSession: AVCaptureSession!
    var cameraOutput: AVCapturePhotoOutput!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var imagePickerController: UIImagePickerController!
    var photoData: Data?
    var project = [Projects]()
    var effect: UIVisualEffect!
    
    //Outlets
    @IBOutlet weak var captureImageView: RoundedImageView!
    @IBOutlet weak var thumbBtn: RoundedShadowButton!
    @IBOutlet weak var flashBtn: RoundedShadowButton!
    @IBOutlet weak var identificationLbl: UILabel!
    @IBOutlet weak var confidenceLbl: UILabel!
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var roundedLblView: RoundedShadowView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    @IBOutlet weak var flipTableView: RoundedImageView!
    
    @IBOutlet weak var imageHoriPopUpConstraint: NSLayoutConstraint!
    @IBOutlet weak var horiPopUpConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        visualEffectView.isHidden = true
        
        let fetchRequest: NSFetchRequest<Projects> = Projects.fetchRequest()
        
        do {
            let project = try PersistenceService.context.fetch(fetchRequest)
            self.project = project
            self.tableView.reloadData()
        } catch {
            
        }
       roundedLblView.isHidden = true
        captureImageView.isHidden = true
        thumbBtn.isHidden = true
        flashBtn.isHidden = true
        
        flipTableView.isHidden = true
        
        view.addSubview(captureImageView)
        view.addSubview(flipTableView)
        //horiPopUpConstraint.constant = -50
        
//        if captureImageView.isHidden == true {
//            self.thumbnailBtn.isHidden = true
//        } else {
//            
//        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer.frame = cameraView.bounds
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapCameraView))
        tap.numberOfTapsRequired = 1
        
        
        
        
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = AVCaptureSession.Preset.hd1920x1080
        
        let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
        
        do {
            let input = try AVCaptureDeviceInput(device: backCamera!)
            if captureSession.canAddInput(input) == true {
                captureSession.addInput(input)
            }
            
            cameraOutput = AVCapturePhotoOutput()
            
            if captureSession.canAddOutput(cameraOutput) == true {
                captureSession.addOutput(cameraOutput!)
                
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                previewLayer.videoGravity = AVLayerVideoGravity.resizeAspect
                previewLayer.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
                
                cameraView.layer.addSublayer(previewLayer!)
                cameraView.addGestureRecognizer(tap)
                captureSession.startRunning()
            }
        } catch {
            debugPrint(error)
        }
    }

    @IBAction func showGalleryBtn(_ sender: Any) {
//        performSegue(withIdentifier: "gallerySegue", sender: self)
//        visualEffectView.isHidden = true
//        captureImageView.isHidden = true
//        thumbBtn.isHidden = true
//        flashBtn.isHidden = true
        animateOut()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            //self.flipTableView.isHidden = true
        self.visualEffectView.isHidden = true
        self.captureImageView.isHidden = true
        self.thumbBtn.isHidden = true
        self.flashBtn.isHidden = true
        }
    }
    

    @IBAction func showPopUp(_ sender: Any) {
        perform(#selector(flip), with: nil, afterDelay: 0)
//        horiPopUpConstraint.constant = -50
//        UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        horiPopUpConstraint.constant = 600
        UIView.animate(withDuration: 0.2, animations: {self.view.layoutIfNeeded()})
//        perform(#selector(flipBack), with: nil, afterDelay: 0.4)
        
        self.captureImageView.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.flipTableView.isHidden = true
        }
        visualEffectView.isHidden = true
        thumbBtn.isHidden = true
        flashBtn.isHidden = true
    }
    
    @IBAction func clearSave(_ sender: Any) {
        perform(#selector(flipBack), with: nil, afterDelay: 0)
    }
    
    @IBAction func thumbnailBtn(_ sender: UIButton) {
        self.saveImage(imageName: "Test.jpg")
    }
    
    @objc func didTapCameraView() {
        let settings = AVCapturePhotoSettings()
        settings.previewPhotoFormat = settings.embeddedThumbnailPhotoFormat
        cameraOutput.capturePhoto(with: settings, delegate: self)
    }
    
 

    @objc func saveImage(imageName: String) {
        //let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) .appendingPathComponent(imageName)
        let image = self.captureImageView.image
        let data = UIImageJPEGRepresentation(image!, 1)
        //fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
        
        
        
        
    }
    
    @objc func flip() {
        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        
        UIView.transition(with: captureImageView, duration: 0.3, options: transitionOptions, animations: {
            self.captureImageView.isHidden = true
        }, completion: nil)
        
        UIView.transition(with: flipTableView, duration: 0.3, options: transitionOptions, animations: {
            self.flipTableView.isHidden = false
        }, completion: nil)
    }
    
    @objc func flipBack() {
        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromLeft, .showHideTransitionViews]
        
        UIView.transition(with: flipTableView, duration: 0.5, options: transitionOptions, animations: {
            self.flipTableView.isHidden = true
        }, completion: nil)
        
        UIView.transition(with: captureImageView, duration: 0.5, options: transitionOptions, animations: {
            self.captureImageView.isHidden = false
        }, completion: nil)
        
        
    }
    
    func animateIn() {
        //self.view.addSubview(captureImageView)
        self.captureImageView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        self.captureImageView.alpha = 0
        self.captureImageView.isHidden = false
        self.visualEffectView.isHidden = false
        UIView.animate(withDuration: 0.2) {
            self.visualEffectView.effect = self.effect
            self.captureImageView.alpha = 1
            self.captureImageView.transform = CGAffineTransform.identity
        }
       
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.2, animations: {
            self.captureImageView.transform = CGAffineTransform.init(scaleX: 1.3, y:1.3)
            self.captureImageView.alpha = 0
            self.visualEffectView.effect = nil
            
        })
//        { (success: Bool) in
//            //self.captureImageView.removeFromSuperview()
//
//        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return project.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel!.text = project[indexPath.row].name
        cell.textLabel!.font = UIFont(name: "Helvetica Neue Light", size: 18.0)
        //cell.detailTextLabel?.text = ""
        return cell
    }
}

extension CameraVC: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            debugPrint(error)
        } else {
            photoData = photo.fileDataRepresentation()
            
            let image = UIImage(data: photoData!)
            self.captureImageView.image = image
//            captureImageView.isHidden = false
            animateIn()
            thumbBtn.isHidden = false
            flashBtn.isHidden = false
            horiPopUpConstraint.constant = -50
            
        }
    }
    @IBAction func unwindFromGalleryVC (unwindSegue: UIStoryboardSegue){
        
    }
}

