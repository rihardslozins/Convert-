//
//  AppInfoViewController.swift
//  Convert+
//
//  Created by Rihards Lozins on 10/02/2021.
//

import UIKit

class AppInfoViewController: UIViewController {
    
    @IBOutlet weak var appInfoLabel: UILabel!
    
    let appInfoLabelText = "This app is created by Rihards and gives you great features, like finding days and temperature converter."
    
    @IBAction func infoButtonClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        appInfoLabel.text = appInfoLabelText
    }
}
