//
//  Snapped.swift
//  PicNPlace
//
//  Created by stone_1 on 30/08/2018.
//  Copyright © 2018 stone1. All rights reserved.
//

import Foundation

struct Snapped {
    private(set) public var title: String
    private(set) public var imageName: String

    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
