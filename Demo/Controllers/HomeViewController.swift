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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

         jDNavigationController?.jDnavigationBar?.changeColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
    }


    @IBAction func setStyle(_ sender: UIButton) {
        self.jDTabBarController?.tabBar.shapeType = Shape(rawValue: sender.tag) ?? Shape.upperRound
        
    }
}
