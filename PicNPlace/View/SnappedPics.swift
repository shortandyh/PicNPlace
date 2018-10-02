//
//  SnappedPics.swift
//  PicNPlace
//
//  Created by stone_1 on 24/09/2018.
//  Copyright © 2018 stone1. All rights reserved.
//

import UIKit

class SnappedPics: UICollectionViewCell {
    @IBOutlet weak var snappedImage: UIImageView!
    @IBOutlet weak var snappedTitle: UILabel!
    
    func updateViews(snapped: ProjectImage) {
        let data = snapped.sImage
        let image : UIImage = UIImage(data: data! as Data)!
        snappedImage.image = image
        snappedTitle.text = snapped.sName
    }
    
}
