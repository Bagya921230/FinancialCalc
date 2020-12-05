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
            
        case .h1Heading,.h3Heading, .content, .contentLight:
            return ColorName.lightSilver
        case .h1HeadingOrange:
            return ColorName.primary
        case .componentTextField, .componentTextFieldSmall,.h2Heading, .component:
            return ColorName.black
        case .componentButtonPrimary, .componentButtonPrimarySmall,.contentWhite:
            return ColorName.white
        case .h4HeadingGreen:
            return ColorName.flashGreen
        case .h4HeadingRed:
            return ColorName.grapeFruitPink
            
        }
    }
}
