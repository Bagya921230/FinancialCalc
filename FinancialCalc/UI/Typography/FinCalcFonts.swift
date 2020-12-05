//
//  FinCalcFonts.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/3/20.
//  Copyright © 2020 iit. All rights reserved.
//

import Foundation
import UIKit

struct FinCalcFonts {
    
    static func font(for typographyStyle: FinCalcTypoStyle) -> UIFont {
        
        switch typographyStyle {
        case .h1Heading, .h1HeadingOrange:
            return bebasNeueBold(size: 36)
        case .h2Heading:
            return bebasNeueBook(size: 24)
        case .h3Heading:
            return bebasNeueRegular(size: 21)
        case .h4HeadingGreen, .h4HeadingRed:
            return robotoMedium(size: 14)
        case .content, .contentLight, .contentWhite:
            return robotoRegular(size: 14)
        case .component:
            return bebasNeueBold(size: 10)
        case .componentButtonPrimary:
            return bebasNeueRegular(size: 21)
        case .componentTextField:
            return robotoMedium(size: 16)
        case .componentTextFieldSmall:
            return robotoMedium(size: 14)
        case .componentButtonPrimarySmall:
            return bebasNeueRegular(size: 18)
            
        }
    }
    
    private static func bebasNeueBook(size: CGFloat) -> UIFont {
        return FontFamily.BebasNeue.book.font(size: size)
    }
    
    private static func bebasNeueBold(size: CGFloat) -> UIFont {
        return FontFamily.BebasNeue.bold.font(size: size)
    }
    
    private static func bebasNeueRegular(size: CGFloat) -> UIFont {
        return FontFamily.BebasNeue.regular.font(size: size)
    }
    
    private static func robotoMedium(size: CGFloat) -> UIFont {
        return FontFamily.Roboto.medium.font(size: size)
    }
    
    private static func robotoRegular(size: CGFloat) -> UIFont {
        return FontFamily.Roboto.regular.font(size: size)
    }
    
}
