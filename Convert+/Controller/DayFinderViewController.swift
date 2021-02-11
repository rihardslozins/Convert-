//
//  ViewController.swift
//  Convert+
//
//  Created by Rihards Lozins on 10/02/2021.
//

import UIKit

class DayFinderViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var weekdayLabel: UILabel!
    @IBOutlet weak var findButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findButton.layer.cornerRadius = 12
        
        dayTextField.delegate = self
        monthTextField.delegate = self
        yearTextField.delegate = self
        
    }
    
    @IBAction func findButtonTapped(_ sender: UIButton) {
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        
        dateComponents.day = Int(dayTextField.text!)
        dateComponents.month = Int(monthTextField.text!)
        dateComponents.year = Int(yearTextField.text!)
        
        
        let date = calendar.date(from: dateComponents)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_EN")
        dateFormatter.dateFormat = "EEEE"
        let weekday = dateFormatter.string(from: date!)
        
        switch findButton.titleLabel?.text {
        
        case "Find":
            findButton.setTitle("Clear", for: .normal)
            
            if dateComponents.day != nil && dateComponents.month != nil && dateComponents.year != nil  {
                weekdayLabel.text = "\(weekday)"
            }else{
                warningPopUp(withTitle: "No Inputs", withMessage: "Provide correct inputs")
            }
        default:
            findButton.setTitle("Find", for: .normal)
            clearAllTextFields()
        }
    }
    
    func clearAllTextFields() {
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        weekdayLabel.text = "Day of the week is?"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func warningPopUp(withTitle title: String?, withMessage message: String?){
        DispatchQueue.main.async {
            
            let popUp = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            popUp.addAction(okButton)
            
            self.present(popUp, animated: true, completion: nil)
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination.
        if segue.identifier == "convertPlus" {
            
            let vc = segue.destination as! AppInfoViewController
            
            // Pass the selected object to the new view controller.
            vc.infoText = "Convert Plus App"
        }
    }
}
