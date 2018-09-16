//
//  DataService.swift
//  PicNPlace
//
//  Created by stone_1 on 26/08/2018.
//  Copyright © 2018 stone1. All rights reserved.
//

import Foundation
class DataService {
    static let instance = DataService()
    
    private let projects = [
        Project(title: "Project 1"),
        Project(title: "Project 2"),
        Project(title: "Project 3")
    ]
    
    private let Project1 = [
        Snapped(imageName: "img1"),
        Snapped(imageName: "img2"),
        Snapped(imageName: "img3")
    ]
    
    private let Project2 = [
        Snapped(imageName: "img4"),
        Snapped(imageName: "img5"),
        Snapped(imageName: "img6")
    ]
    
    private let Project3 = [
        Snapped(imageName: "img7"),
        Snapped(imageName: "img8"),
        Snapped(imageName: "img9")
    ]
    
    func getProjects() -> [Project] {
        return projects
    }
    
//    func getSnapped(forProjectTitle title:String) -> [Snapped] {
//        switch title {
//    }
}
