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
        Snapped(title: "Chair", imageName: "SHIRT01"),
        Snapped(title: "big Chair", imageName: "SHIRT02"),
        Snapped(title: "oak table", imageName: "SHIRT03")
    ]
    
    private let Project2 = [
        Snapped(title: "green paint", imageName: "SHIRT01"),
        Snapped(title: "pattern wallpaper", imageName: "SHIRT02"),
        Snapped(title: "jumper", imageName: "SHIRT03")
    ]
    
    private let Project3 = [
        Snapped(title: "shoes", imageName: "SHIRT01"),
        Snapped(title: "pants", imageName: "SHIRT02"),
        Snapped(title: "lights", imageName: "SHIRT03")
    ]
    
    func getProjects() -> [Project] {
        return projects
    }
    
    func getSnapped(forSnappedTitle title:String) -> [Snapped] {
        switch title {
        case "Project 1":
            return getProj1()
        case "Project 2":
            return getProj2()
        case "Project 3":
            return getProj3()
        default:
            return getProj1()
        }
    }
        
        func getProj1() -> [Snapped] {
            return Project1
        }
        
        func getProj2() -> [Snapped] {
            return Project2
        }
        
        func getProj3() -> [Snapped] {
            return Project3
        }
}
