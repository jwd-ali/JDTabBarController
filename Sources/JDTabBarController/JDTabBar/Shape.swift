//
//  Shape.swift
//  JDTabBarController
//
//  Created by Jawad Ali on 11/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit
public enum Shape: Int {
    case full
    case upperRound
    case lowerRound
    case rounded
    
    
    var maskCorenrs: CACornerMask {
        get {
            switch self {
            case .full:
                return  []
            case .upperRound:
                return [ .layerMaxXMinYCorner, .layerMinXMinYCorner ]
            case .lowerRound:
                return  [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            case .rounded:
                return [.layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMinXMinYCorner]
            }
            
        }
    }
    
    var layoutMargins: [CGFloat] {
        get {
            switch self {
            case .full, .upperRound:
                return [0,0,0,0]
            default:
                return [5,5,0,10]
            }
        }
    }
    
    
}
