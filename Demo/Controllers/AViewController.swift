//
//  AViewController.swift
//  SOTabBar_Example
//
//  Created by Jawad Ali on 04/09/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
          jDNavigationController?.jDnavigationBar?.changeColor(#colorLiteral(red: 0.2199882269, green: 0.8307816982, blue: 0.8380283117, alpha: 1))
       
    }


}
