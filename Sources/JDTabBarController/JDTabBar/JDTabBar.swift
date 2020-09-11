//
//  JDTabBar.swift
//  JDTabBarController
//
//  Created by Jawad Ali on 04/09/2020.
//

import UIKit

public protocol JDTabBarDelegate: AnyObject {
    func tabBar(_ tabBar: JDTabBar, didSelectTabAt index: Int)
}

public class JDTabBar: UIView {
    
    //MARK:- Public Properties
    open var tabBarTintColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) {
        didSet {
            self.stackView.arrangedSubviews.enumerated().forEach {
                ($1 as? JDTabBarItem)?.imageSelectedTintColor = tabBarTintColor
            }
            setNeedsDisplay()
        }
    }
    
    public var circleSize: CGFloat = 65 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var circleBorderWidth: CGFloat = 10 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    open var shapeType: Shape = .upperRound {
        didSet{
            setNeedsDisplay()
        }
    }
    
    public var colors: [UIColor?] = [ #colorLiteral(red: 0.5172309279, green: 0.7993689179, blue: 0.9946866632, alpha: 1), #colorLiteral(red: 1, green: 0.7976374626, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.644939661, blue: 0.5219646692, alpha: 1), #colorLiteral(red: 0.3568160534, green: 0.8285983205, blue: 0.892596066, alpha: 1) ] {
        didSet {
            for (index, item) in stackView.arrangedSubviews.enumerated() {
                if let tabBarItem = item as? JDTabBarItem {
                    tabBarItem.color = colors[index]
                }
                if isOffSetOn { backgroundColor = colors[selectedIndex] }
            }
        }
    }
    
    internal  var viewControllers = [UIViewController]() {
        didSet {
            guard !viewControllers.isEmpty else { return }
            
            DispatchQueue.main.async {
                self.drawTabs()
                self.didSelectTab(index: 0)
            }
        }
    }
    
    internal var isOffSetOn: Bool = true {
        didSet {
            self.cornerBackgroundView.isHidden = !isOffSetOn
            self.setNeedsDisplay()
        }
    }
    
    //MARK:- Views
    private lazy var stackView = UIStackViewFactory.createStackView(with: .horizontal, alignment: .center, distribution: .fillEqually, spacing: 0)
    
    private lazy var innerCircleView: UIView = {
        let view = UIView()
        view.backgroundColor = tabBarTintColor
        return view
    }()
    
    private lazy var outerCircleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cornerBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.maskedCorners = shapeType.maskCorenrs
        view.layer.masksToBounds = true
        view.clipsToBounds = false
        return view
    }()
    
    //MARK:- delegate
    
    weak var delegate: JDTabBarDelegate?
    
    //MARK:- Private properties
    
    private var selectedIndex: Int = 0
    private var previousSelectedIndex = 0
    
    //MARK:- initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setUp()
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        setupConstraints()
        cornerBackgroundView.backgroundColor = self.tabBarTintColor
        
        cornerBackgroundView.layer.cornerRadius = bounds.midY - shapeType.layoutMargins.last!/2
        cornerBackgroundView.layer.maskedCorners = shapeType.maskCorenrs
        
        innerCircleView.backgroundColor = tabBarTintColor
        cornerBackgroundView.layoutIfNeeded()
        
        cornerBackgroundView.layer.shadowOffset = .zero
        cornerBackgroundView.layer.shadowOpacity = 0.18
        cornerBackgroundView.layer.shadowRadius = 10
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touchArea = touches.first?.location(in: self).x else {
            return
        }
        let index = Int(floor(touchArea / tabWidth))
        didSelectTab(index: index)
    }
}

//MARK:- set upview and constraints
private extension JDTabBar {
    func setUp() {
        setUpView()
        setupConstraints()
    }
    
    func setUpView() {
        innerCircleView.addSubview(outerCircleView)
        
        addSubview(innerCircleView)
        addSubview(stackView)
    }
    func setupConstraints() {
        
        innerCircleView.frame = CGRect(origin: CGPoint(x: 0, y: -circleSize/2), size: CGSize(width: circleSize, height: circleSize))
        
        innerCircleView.layer.cornerRadius = circleSize / 2
        outerCircleView.layer.cornerRadius = (innerCircleView.frame.size.height - circleBorderWidth) / 2
        
        cornerBackgroundView.removeFromSuperview()
        insertSubview(cornerBackgroundView, at: 0)
        
        cornerBackgroundView
            .alignEdgesWithSuperview([.left, .right, .top, .bottom], constants:shapeType.layoutMargins)
        
        outerCircleView
            .centerInSuperView()
            .width(constant: circleSize - circleBorderWidth)
            .height(constant: circleSize - circleBorderWidth)
        
        stackView
            .alignAllEdgesWithSuperview()
    }
    
}

//MARK:- Add JDTabBarItem in tabBar
extension JDTabBar {
    private func drawTabs() {
        for (index , vc) in viewControllers.enumerated() {
            let barView = JDTabBarItem(tabBarItem: vc.tabBarItem, color: colors[index] ?? tabBarTintColor, tintColor: .lightGray)
            
            barView
                .height(constant: stackView.bounds.maxY)
            
            self.stackView.addArrangedSubview(barView)
        }
    }
}

//MARK:- Touch Handling

extension JDTabBar {
    
    private  var tabWidth: CGFloat {
        return (UIScreen.main.bounds.width / CGFloat(viewControllers.count))
    }
    
    private var circleTransition: (startX:CGFloat, endX: CGFloat) {
        let startPoint_X = CGFloat(previousSelectedIndex) * CGFloat(tabWidth) - (tabWidth * 0.5)
        let endPoint_X = CGFloat(selectedIndex) * CGFloat(tabWidth) - (tabWidth * 0.5)
        return (startPoint_X,endPoint_X)
    }
    
    func didSelectTab(index: Int) {
        delegate?.tabBar(self, didSelectTabAt: index)
        if index + 1 == selectedIndex {return}
        
        previousSelectedIndex = selectedIndex
        selectedIndex  = index + 1
        
        outerCircleView.backgroundColor = colors[index]
        self.backgroundColor =  isOffSetOn ? colors[index] : tabBarTintColor
        
        innerCircleView.layer.animateShapeSpring(from: circleTransition.startX, endX: circleTransition.endX)
        animateTabItem(index: index)
    }
}
//MARK:- Animation shape
private extension JDTabBar {
    
    func animateTabItem(index: Int) {
        self.stackView.arrangedSubviews.enumerated().forEach {
            guard let tabView = $1 as? JDTabBarItem else { return }
            ($0 == index ? tabView.animateTabSelected : tabView.animateTabDeSelect)()
        }
    }
}

