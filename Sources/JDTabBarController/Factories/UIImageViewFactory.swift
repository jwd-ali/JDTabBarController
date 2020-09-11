//
//  JDTabBarItem.swift
//  JDTabBarController
//
//  Created by Jawad Ali on 06/09/2020.
//

import UIKit

public class UIImageViewFactory {
    
    public class func createBackgroundImageView(mode: UIImageView.ContentMode = .scaleAspectFill, image: UIImage = UIImage(named: "image_backgound")!) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = mode
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        return imageView
    }
    
    public class func createImageView(mode: UIImageView.ContentMode = .scaleAspectFill, image: UIImage? = nil, tintColor: UIColor? = .clear) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = mode
        imageView.tintColor = tintColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        return imageView
    }
}
