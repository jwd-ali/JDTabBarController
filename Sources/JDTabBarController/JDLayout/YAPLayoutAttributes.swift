//
//  JDTabBarItem.swift
//  JDTabBarController
//
//  Created by Jawad Ali on 04/09/2020.
//

import UIKit

enum YAPLayoutAxis {
    case vertical
    case horizontal
    case dimensions
}

public enum YAPLayoutEdge {
    case left
    case right
    case top
    case bottom
    case bottomAvoidingKeyboard
    case safeAreaLeft
    case safeAreaRight
    case safeAreaTop
    case safeAreaBottom
    case safeAreaBottomAvoidingKeyboard
    case centerX
    case centerY
    case height
    case width
}

extension YAPLayoutEdge {
    var axis: YAPLayoutAxis {
        switch self {
        case .left, .right, .centerX, .safeAreaLeft, .safeAreaRight:
            return .horizontal
        case .bottom, .top, .centerY, .safeAreaTop, .safeAreaBottom, .bottomAvoidingKeyboard, .safeAreaBottomAvoidingKeyboard:
            return .vertical
        case .height, .width:
            return .dimensions
            
        }
    }
    
    var safeAreaEdge: YAPLayoutEdge {
        switch self {
        case .left, .safeAreaLeft:
            return .safeAreaLeft
        case .top, .safeAreaTop:
            return .safeAreaTop
        case .right, .safeAreaRight:
            return .safeAreaRight
        case .bottom, .safeAreaBottom, .bottomAvoidingKeyboard, .safeAreaBottomAvoidingKeyboard:
            return .safeAreaBottom
        default:
            return .safeAreaLeft
        }
    }
}

public enum YAPLayoutConstantModifier {
    case equalTo
    case lessThanOrEqualTo
    case greaterThanOrEqualTo
}

internal extension UIView {
    func horizontalAnchor(_ edge: YAPLayoutEdge) -> NSLayoutXAxisAnchor {
        switch edge {
        case .left:
            return leadingAnchor
        case .right:
            return trailingAnchor
        case .centerX:
            return centerXAnchor
        case .safeAreaLeft:
            return safeAreaLayoutGuide.leadingAnchor
        case .safeAreaRight:
            return safeAreaLayoutGuide.trailingAnchor
        default:
            return leadingAnchor
        }
    }
    
    func verticalAnchor(_ edge: YAPLayoutEdge) -> NSLayoutYAxisAnchor {
        switch edge {
        case .top:
            return topAnchor
        case .bottom, .bottomAvoidingKeyboard:
            return bottomAnchor
        case .centerY:
            return centerYAnchor
        case .safeAreaTop:
            return safeAreaLayoutGuide.topAnchor
        case .safeAreaBottom, .safeAreaBottomAvoidingKeyboard:
            return safeAreaLayoutGuide.bottomAnchor
        default:
            return topAnchor
        }
    }
    
    func dimensionAnchor(_ edge: YAPLayoutEdge) -> NSLayoutDimension {
        switch edge {
        case .width:
            return widthAnchor
        case .height:
            return heightAnchor
        default:
            return widthAnchor
        }
    }
}
