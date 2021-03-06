//
//  UIViewExtension.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/3/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit

extension UIView {
    
    @discardableResult
    func layoutTop(_ item: UIView, margin: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = item.topAnchor.constraint(equalTo: topAnchor, constant: -margin)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func layoutBottom(_ item: UIView, margin: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = item.bottomAnchor.constraint(equalTo: bottomAnchor, constant: margin)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func layoutLeft(_ item: UIView, margin: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = item.leftAnchor.constraint(equalTo: leftAnchor, constant: -margin)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func layoutRight(_ item: UIView, margin: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = item.rightAnchor.constraint(equalTo: rightAnchor, constant: margin)
        constraint.isActive = true
        return constraint
    }
    
    func addSubviewForConstraints(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
    }
    
    func addSubviewFittingSize(_ subview: UIView, insets: UIEdgeInsets = .zero) {
        addSubviewForConstraints(subview)
        subview.layout(fitting: self, insets: insets)
    }
    
    @discardableResult
    func layout(fitting parent: UIView, insets: UIEdgeInsets = .zero) -> [NSLayoutConstraint] {
        return [
            layoutTop(parent, margin: insets.top),
            layoutBottom(parent, margin: insets.bottom),
            layoutLeft(parent, margin: insets.left),
            layoutRight(parent, margin: insets.right)
        ]
    }
    @discardableResult
    func fromNib<T: UIView>() -> T? {
        guard let contentView = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)),
                                                                         owner: self,
                                                                         options: nil)?.first as? T else {
                                                                            return nil
        }
        
        addSubviewForConstraints(contentView)
        contentView.layout(fitting: self)
        return contentView
    }
    
    @discardableResult
    func layoutWidth(_ width: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: width
        )
        constraint.priority = UILayoutPriority(850)
        addConstraint(constraint)
        return constraint
    }
    
    @discardableResult
    func layoutWidth(equalTo item: UIView, multiplier: CGFloat = 1) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .width,
            relatedBy: .equal,
            toItem: item,
            attribute: .width,
            multiplier: multiplier,
            constant: 0
        )
        constraint.priority = UILayoutPriority(850)
        item.addConstraint(constraint)
        return constraint
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
    
}
