//
//  FinCalcStringAttributes.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/3/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit

struct FinCalcStringAttributes {
    
    static func attributes(for typographyStyle: FinCalcTypoStyle,
                           alignment: NSTextAlignment = .left) -> [NSAttributedString.Key: Any] {
        
        var attributes: [NSAttributedString.Key: Any] = [:]
        
        attributes[.font] = FinCalcFonts.font(for: typographyStyle).scaled
        attributes[.foregroundColor] = colorsForTypographyStyles(for: typographyStyle).color
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        
        attributes[.paragraphStyle] = paragraphStyle
        
        return attributes
    }
    
    private static func colorsForTypographyStyles(for typographyStyle: FinCalcTypoStyle) -> ColorName {
        
        switch typographyStyle {
            
        case .h1Heading, .h3HeadingWhite, .h4HeadingWhite, .componentButtonSecondary, .componentButtonSecondarySmall, .h3HeadingWhiteBold, .h1SubHeading:
            return ColorName.lightSilver
        case .h1HeadingOrange, .h3HeadingOrange, .h4HeadingOrange:
            return ColorName.primary
        case .h3Heading, .content:
            return ColorName.lightSilver
        case .h2Heading, .component, .componentButtonSmall:
            return ColorName.black
        case .componentTextField,.contentWhite, .componentTextFieldSmall:
            return ColorName.black
        case .h4HeadingPink:
            return ColorName.grapeFruitPink
        case .contentLight:
            return ColorName.lightSilver
        case .componentButtonPrimary, .componentButtonPrimarySmall:
            return ColorName.white
            
        }
    }
}
