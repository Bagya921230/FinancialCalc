//
//  FinCalcLabel.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/3/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit

class FinCalcLabel: UILabel {
    
    private var attributes = FinCalcStringAttributes.attributes(for: .h2Heading)
    
    private var typograpyStyle: FinCalcTypoStyle!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure() {
        adjustsFontForContentSizeCategory = true
        numberOfLines = 0
    }
    
    // Must be called after setting the attributed text
    func setNumberOfLines(_ numOfLines: Int, breakMode: NSLineBreakMode = .byTruncatingTail) {
        numberOfLines = numOfLines
        lineBreakMode = breakMode
    }
    
    func setText(_ text: String,
                 withBoldTextSections boldSections: [String]) {
        
        let attributes = FinCalcStringAttributes.attributes(for: .contentLight, alignment: .left)
        
        let attributedFullString = NSMutableAttributedString(string: text,
                                                             attributes: attributes)
        
        boldSections.forEach { section in
            let rangeOfSection = attributedFullString.mutableString.range(of: section)
            attributedFullString.addAttribute(.font,
                                              value: FontFamily.Roboto.bold.font(size: 14),
                                              range: rangeOfSection)
        }
        
        attributedText = attributedFullString
        
        accessibilityLabel = text
    }
    
    func setText(_ text: String) {
        self.text = text
        setLetterSpacing()
    }
    
    func set(_ text: String, typographyStyle: FinCalcTypoStyle, alignment: NSTextAlignment = .left) {
        typograpyStyle = typographyStyle
        self.text = text
        accessibilityLabel = text
        
        self.attributes = FinCalcStringAttributes.attributes(for: typographyStyle, alignment: alignment)
        
        setLetterSpacing()
    }
    
    func setAttributesForStrikeThrough(_ text: String, typographyStyle: FinCalcTypoStyle, alignment: NSTextAlignment = .left) {
        self.text = text
        accessibilityLabel = text
        
        self.attributes = FinCalcStringAttributes.attributes(for: typographyStyle, alignment: alignment)
        
        let attributedString = NSMutableAttributedString(string: text, attributes: self.attributes)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: letterSpacingForTypographyStyle(for: typographyStyle), range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributedString.length))
        
        attributedText = attributedString
    }
    
    func setLetterSpacing() {
        let attributedString = NSMutableAttributedString(string: self.text ?? "", attributes: self.attributes)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: letterSpacingForTypographyStyle(for: typograpyStyle), range: NSRange(location: 0, length: self.text?.count ?? 0))

        attributedText = attributedString
    }
    
    private func letterSpacingForTypographyStyle(for typographyStyle: FinCalcTypoStyle) -> CGFloat {
        switch typographyStyle {
            
        case .h1Heading, .h1HeadingOrange:
            return 6
        case .h2Heading:
            return 4
        case .h3Heading:
            return 3.5
        case .h4HeadingRed,.h4HeadingGreen:
            return 1.75
        case .content, .contentLight, .contentWhite:
            return 0.58
        case .component:
            return 0
        case .componentButtonPrimary, .componentButtonPrimarySmall:
            return 2.63
        case .componentTextField, .componentTextFieldSmall:
            return 0.5
            
        }
    }
    
}

