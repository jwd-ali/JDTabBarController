//
//  JDTabBarController.swift
//  SOTabBar
//
//  Created by Jawad Ali on 05/09/2020.
//

import UIKit

public protocol JTabBarControllerDelegate: NSObjectProtocol {
    func tabBarController(_ tabBarController: JTabBarController, didSelect viewController: UIViewController)
}
open class JTabBarController: UIViewController {
    
    //MARK:- Properties
    weak open var delegate: JTabBarControllerDelegate?
    
    public var selectedIndex: Int = 0 {
        didSet {
            tabBar.didSelectTab(index: selectedIndex)
        }
    }
    
    public var isRoundedOffsetOn:Bool = true {
        didSet { tabBar.isOffSetOn = isRoundedOffsetOn }
    }
    private var selectIndex = 0
    private(set) public var previousSelectedIndex = 0
    public var viewControllers = [UIViewController]() {
        didSet { tabBar.viewControllers = viewControllers }
    }
    public var tabBarHeight: CGFloat = 80
    
    //MARK:- Views
    public lazy var tabBar: JTabBar = {
        let tabBar = JTabBar()
        tabBar.delegate = self
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
    private lazy var stack = UIStackViewFactory.createStackView(with: .vertical, alignment: .fill, distribution: .fill, arrangedSubviews: [containerView,tabBar])
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        return view
    }()
    
    //MARK:- Lifecycle
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(stack)
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      //  self.drawConstraint()
       
    }
    
    open override func viewDidLayoutSubviews() {
        self.drawConstraint()
    }
    
    private func drawConstraint() {
        tabBar
            .height(constant: tabBarHeight)
        
        stack
            .alignAllEdgesWithSuperview()
    }
    
}
extension JTabBarController: JTabBarDelegate {
    public func tabBar(_ tabBar: JTabBar, didSelectTabAt index: Int) {
        
        let previousVC = viewControllers[index]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        previousSelectedIndex = selectIndex
        
        let vc = viewControllers[index]
        delegate?.tabBarController(self, didSelect: vc)
        addChild(vc)
        selectIndex = index + 1
        vc.view.frame = containerView.bounds
        containerView.addSubview(vc.view)
        vc.didMove(toParent: self)
        
    }
}
