//
//  FinCalcTextField.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/3/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit

protocol FinCalcTextFieldDelegate: class {
    func finCalcTextFieldDidTextChanged(_ finCalcTextField: FinCalcTextField, for text: String)
    func finCalcFieldReturnTapped(_ finCalcTextField: FinCalcTextField)
}

class FinCalcTextField: UITextField {
    
    private weak var finCalcTextFieldDelegate: FinCalcTextFieldDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func setup(placeholder: String,
               delegate: FinCalcTextFieldDelegate) {
        finCalcTextFieldDelegate = delegate
        setupPlaceholder(placeholder: placeholder)
    }
    
    func setKeyboard(keyboardType: UIKeyboardType,
                     returnKeyType: UIReturnKeyType = .next,
                     autocapitalizationType: UITextAutocapitalizationType = .none,
                     autocorrectionType: UITextAutocorrectionType = .no) {
        
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        self.autocapitalizationType = autocapitalizationType
        self.autocorrectionType = autocorrectionType
    }
    
    private func configure() {
        setupDelegates()
        setupUI()
    }
    
    private func setupDelegates() {
        delegate = self
        addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    private func setupUI() {
        let space = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 13.0, height: 2.0))
        leftView = space
        rightView = space
        rightViewMode = .always
        leftViewMode = .always
        
        font = FinCalcFonts.font(for: .componentTextField)
        layer.cornerRadius =  5
        backgroundColor = ColorName.white.color
        textColor = ColorName.black.color
        keyboardAppearance = .light
    }
    
    private func setupPlaceholder(placeholder: String) {
        let attributedPlaceholderString = NSMutableAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        attributedPlaceholderString.addAttribute(NSAttributedString.Key.kern, value: 0.5, range: NSRange(location: 0, length: placeholder.count))
        attributedPlaceholder = attributedPlaceholderString
    }
    
    public func showError() {
        layer.borderColor = ColorName.grapeFruitPink.color.cgColor
        layer.borderWidth = 1
    }
    
    private func updateUI() {
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 0
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
       updateUI()
       finCalcTextFieldDelegate?.finCalcTextFieldDidTextChanged(self, for: textField.text ?? "")
    }
}

extension FinCalcTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        updateUI()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        finCalcTextFieldDelegate?.finCalcFieldReturnTapped(self)
        return false
    }
    
}
