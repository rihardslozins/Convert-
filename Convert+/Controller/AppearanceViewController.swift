//
//  AppearanceViewController.swift
//  Convert+
//
//  Created by Rihards Lozins on 10/02/2021.
//

import UIKit

class AppearanceViewController: UIViewController {
    
    @IBOutlet weak var appearanceTextLabel: UILabel!
    @IBOutlet weak var settingsButtonUI: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()
        settingsButtonUI.layer.cornerRadius = 12
    }
    
    @IBAction func openSettingsButtonTapped(_ sender: Any) {
        openSettings()
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func openSettings() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
        
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, options: [:]) { (success) in
            }
        }
    }
    
    func setLabelText() {
        var text = "Unable to specify User Interface Style"
        if self.traitCollection.userInterfaceStyle == .dark {
            text = "Dark Mode is On"
        } else {
            text = "Light Mode is On"
        }
        appearanceTextLabel.text = text
    }
}

extension AppearanceViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
    
}//end
