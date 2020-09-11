//
//  JDTabBarController.swift
//  JDTabBarController
//
//  Created by Jawad Ali on 05/09/2020.
//

import UIKit


public protocol JDTabBarControllerDelegate: NSObjectProtocol {
    func tabBarController(_ tabBarController: JDTabBarController, didSelect viewController: UIViewController)
}
open class JDTabBarController: UIViewController {
    
    //MARK:- Properties
    weak open var delegate: JDTabBarControllerDelegate?
    
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
    public lazy var tabBar: JDTabBar = {
        let tabBar = JDTabBar()
        tabBar.delegate = self
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
    private lazy var stack = UIStackViewFactory.createStackView(with: .vertical, alignment: .fill, distribution: .fill, arrangedSubviews: [containerView,tabBar])
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    //MARK:- Lifecycle
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(stack)
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
extension JDTabBarController: JDTabBarDelegate {
    public func tabBar(_ tabBar: JDTabBar, didSelectTabAt index: Int) {
        
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
