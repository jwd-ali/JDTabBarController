//
//  SearchViewController.swift
//  Demo
//
//  Created by Jawad Ali on 10/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        self.title = "Search"
       
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func changeTintColor(_ sender: UIButton) {
        jDTabBarController?.tabBar.tabBarTintColor = sender.backgroundColor ?? .white
    }
    

}
