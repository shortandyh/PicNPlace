//
//  SnappedVC.swift
//  PicNPlace
//
//  Created by stone_1 on 24/09/2018.
//  Copyright © 2018 stone1. All rights reserved.
//

import UIKit
import CoreData

class SnappedVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var  snappedCollection: UICollectionView!
    
    private(set) public var snapped = [Snapped]()
    
    var projects = [Projects]()
    var imageArray = [ProjectImage]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var selectedProject : Projects? {
        didSet{
            loadImages()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        snappedCollection.dataSource = self
        snappedCollection.delegate = self
    }
    
    func loadProjects() {
        
        let request : NSFetchRequest<Projects> = Projects.fetchRequest()
        
        do {
            projects = try context.fetch(request)
        } catch {
            print("Error saving project \(error)")
        }
        
//        tableView.reloadData()
        
    }
    
    func loadImages(with request : NSFetchRequest<ProjectImage> = ProjectImage.fetchRequest()) {
        
        let predicate = NSPredicate(format: "parentProject.name MATCHES &@", selectedProject!.name!)
        
        request.predicate = predicate
        
        do {
            imageArray = try context.fetch(request)
        } catch {
            print("Error saving project \(error)")
        }
        
        //        self.collectionView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func initSnapped(project: Project) {
//        snapped = DataService.instance.getSnapped(forSnappedTitle: project.title)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return snapped.count
//    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SnappedPics", for: indexPath) as?  SnappedPics{
            let imageName = imageArray[indexPath.row]
            let image: UIImage = UIImage(data: imageArray[indexPath.row].sImage! as Data)!
//            UIImage(data: image, scale:1.0)
            cell.snappedImage.image = image
            cell.snappedTitle.text = imageName.sName
            return cell
        }
        return SnappedPics()
    }
   

}
