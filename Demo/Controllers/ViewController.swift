//
//  ViewController.swift
//  Demo
//
//  Created by Jawad Ali on 09/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit
import JDTabBarController
class ViewController: JDTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        let homeStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HOME_ID")
        let chatStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CHAT_ID")
        let sleepStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SLEEP_ID")
        let musicStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MUSIC_ID")
       
        
        homeStoryboard.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        chatStoryboard.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), tag: 1)
        sleepStoryboard.tabBarItem = UITabBarItem(title: "Report", image: UIImage(named: "report"), tag: 2)
        musicStoryboard.tabBarItem = UITabBarItem(title: "Alerts", image: UIImage(named: "notification"), tag: 3)
       
        viewControllers = [homeStoryboard, chatStoryboard, sleepStoryboard, musicStoryboard]

    }
    
}

extension ViewController: JDTabBarControllerDelegate {
    func tabBarController(_ tabBarController: JDTabBarController, didSelect viewController: UIViewController) {
        print(viewController.tabBarItem.title ?? "")
    }
}
 
