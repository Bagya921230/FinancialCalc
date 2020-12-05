//
//  ViewController.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 11/30/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit

class ViewController: CustomViewController {

    //MARK: Outlet
    @IBOutlet weak var greetingLabel: FinCalcLabel!
    @IBOutlet weak var appNameLabel: FinCalcLabel!
    @IBOutlet weak var appNameSubLabel: FinCalcLabel!
    @IBOutlet weak var dynamicImageView: UIImageView!
    @IBOutlet weak var dynamicLabel: FinCalcLabel!
    @IBOutlet weak var continueButton: PrimaryButton!
    
    @IBAction func continueAction(_ sender: Any) {
        performSegue(withIdentifier: "segueHome", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
        greetingLabel.set(L10n.greetingText, typographyStyle: .h2Heading, alignment: .center)
        appNameLabel.set(L10n.appNameText1, typographyStyle: .h1Heading, alignment: .right)
        appNameSubLabel.set(L10n.appNameText2, typographyStyle: .h1HeadingOrange, alignment: .left)
        dynamicLabel.set(L10n.dynamicText1, typographyStyle: .content, alignment: .center)
        continueButton.setTitle(L10n.continueText)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }


}

