//
//  JDTabBarItem.swift
//  JDTabBarController
//
//  Created by Jawad Ali on 04/09/2020.
//

import UIKit

public class JDTabBarItem: UIView {
    
    //MARK:- Properties
    private let image: UIImage
    private let title: String
    
    public var color: UIColor? {
        didSet{
            titleLabel.textColor = color
        }
    }
    
    private var imageCenterYConstraint : NSLayoutConstraint?
    private var titleCenterYConstraint : NSLayoutConstraint?
    
    public var imageSelectedTintColor: UIColor = .white {
        didSet{
            if titleLabel.alpha != 0 {
           imageView.tintColor =  imageSelectedTintColor
            }
        }
    }
    
    open var imageTintColor: UIColor = .lightGray
    open var animationDuration: Double = 0.5
    open var badgeColor: UIColor?
    open var badgeValue: String?
    var imageSize: CGFloat = 25
    
    //MARK:- Views
    private lazy var titleLabel = UILabelFactory.createUILabel(with: color ?? .black,font:UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold), alignment: .center, text: self.title)
    
    private lazy var imageView = UIImageViewFactory.createImageView(mode: .scaleAspectFit, image: image, tintColor: imageTintColor)
    
    //MARK:- initialiser
    
    init(tabBarItem item: UITabBarItem, color: UIColor, tintColor:UIColor) {
        
        
        guard let selecteImage = item.image else {
            fatalError("You should set image to all view controllers")
        }
        
        self.imageTintColor = tintColor
        self.color = color
        self.image = selecteImage.withRenderingMode(.alwaysTemplate)
        self.title = item.title ?? ""
        super.init(frame: .zero)
        
        print(bounds)
        
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK:- setup View
private extension JDTabBarItem {
    func setup() {
        setupViews()
        setupConstraints()
    }
    func setupViews() {
        addSubview(imageView)
        addSubview(titleLabel)
        
        titleLabel.layer.shadowOffset = CGSize(width: 0, height: 1)
        titleLabel.layer.shadowOpacity = 0.2
        titleLabel.layer.shadowRadius = 1
        titleLabel.minimumScaleFactor = 0.5
        
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
    }
    func setupConstraints() {
        
        imageView
            .width(constant: imageSize)
            .height(constant: imageSize)
            .centerHorizontallyInSuperview()
        
        imageCenterYConstraint = imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        imageCenterYConstraint?.isActive = true
        
        
        titleLabel
            .alignEdgesWithSuperview([.left, .right])
        
        titleCenterYConstraint = titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        titleCenterYConstraint?.isActive = true
        
    }
}

//MARK:- Select / DeSelect item
internal extension JDTabBarItem {
     func animateTabSelected() {
        self.titleLabel.alpha = 1
        titleCenterYConstraint?.constant = -25
        imageCenterYConstraint?.constant = -45
        imageView.tintColor = imageSelectedTintColor
        
        UIView.animate(withDuration: animationDuration) {
            self.layoutIfNeeded()
         }
     }
     
      func animateTabDeSelect() {
        imageCenterYConstraint?.constant = -5
        imageView.tintColor = imageTintColor
        UIView.animate(withDuration: animationDuration, animations: {
            self.titleLabel.alpha = 0
            self.layoutIfNeeded()
        }) { _ in
            self.titleCenterYConstraint?.constant = 50
            self.layoutIfNeeded()
        }
     }
}
