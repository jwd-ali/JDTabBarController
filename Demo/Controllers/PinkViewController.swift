//
//  PinkViewController.swift
//  SOTabBar_Example
//
//  Created by Jawad Ali on 02/09/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class PinkViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    override func viewDidLoad() {
        
        self.title = "Reports"
     jDNavigationController?.jDnavigationBar?.changeColor(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
      //  self.view.centerXAnchor
      //  self.tabBarController
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      //  self.sOTabBarController?.tabBar.isHidden = true
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

                 
               
    }

    @IBAction func goTo(_ sender: UIButton) {
        self.jDTabBarController?.selectedIndex = sender.tag
    }
    
}

@IBDesignable public class ShadowButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
         commonInit()
    }
    
    private func commonInit() {
        self.addShadow()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
         self.addShadow()
    }
 
}

public extension ShadowButton {
     func addShadow() {
        layer.cornerRadius = bounds.midY
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: 0,height: 5)
    }
}
