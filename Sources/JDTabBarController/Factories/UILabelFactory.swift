//
//  JDTabBarItem.swift
//  JDTabBarController
//
//  Created by Jawad Ali on 06/09/2020.
//

import UIKit


public class UILabelFactory {

    public class func createUILabel<T: UILabel>(with color: UIColor = .black, font: UIFont = UIFont.systemFont(ofSize: 17), alignment: NSTextAlignment = .left, numberOfLines: Int = 1, lineBreakMode: NSLineBreakMode = .byTruncatingTail, text: String? = nil, alpha: CGFloat = 1.0) -> T {
        let label = T()
        label.font = font
        label.textColor = color
        label.textAlignment = alignment
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.text = text
        label.alpha = alpha
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
