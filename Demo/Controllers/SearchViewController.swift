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
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)

           jDNavigationController?.jDnavigationBar?.changeColor(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1))
                          
       }


    @IBAction func changeTintColor(_ sender: UIButton) {
        jDTabBarController?.tabBar.tabBarTintColor = sender.backgroundColor ?? .white
    }
    

}
