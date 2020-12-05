//
//  PrimaryButton.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/3/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit

class PrimaryButton: UIButton {
    
    @IBOutlet weak var buttonTitleLabel: FinCalcLabel!
    @IBOutlet weak var backgroundView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure() {
        fromNib()
        setupUI()
        updateUI()
    }
    
    private func setupUI() {
        backgroundColor = .clear
        setTitle(nil, for: .normal)
        setupTitleLabel()
    }
    
    private func setupTitleLabel() {
      
        buttonTitleLabel.text = nil
        buttonTitleLabel.adjustsFontForContentSizeCategory = true
    }
    
    func setTitle(_ title: String) {
        let isSmallScreen : Bool = UIDevice.current.isSmallScreen ? true : false
        buttonTitleLabel.set(title, typographyStyle: isSmallScreen ? .componentButtonPrimarySmall : .componentButtonPrimary, alignment: .center)
        accessibilityLabel = title
    }
    
    private func updateUI() {
        backgroundView.backgroundColor = isEnabled ? ColorName.flashGreen.color : ColorName.buttonGrey.color
        backgroundView.layer.cornerRadius = 5
        let textColor: UIColor
        if !isEnabled {
            textColor = ColorName.disabledWhite.color
        } else if isHighlighted {
            textColor = ColorName.white.color
        } else {
            textColor = ColorName.white.color
        }
        if isHighlighted {
            backgroundView.backgroundColor = ColorName.primary.color
        }
        
        buttonTitleLabel.textColor = textColor
    }
    
    override var isHighlighted: Bool {
        didSet {
            updateUI()
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            updateUI()
        }
    }
}
