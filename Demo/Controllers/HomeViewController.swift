//
//  HomeViewController.swift
//  Demo
//
//  Created by Jawad Ali on 10/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit
import JDTabBarController
class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Home"
        
    }


    @IBAction func setStyle(_ sender: UIButton) {
        self.jDTabBarController?.tabBar.shapeType = Shape(rawValue: sender.tag) ?? Shape.upperRound
        
    }
}
