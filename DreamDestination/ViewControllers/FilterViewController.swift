//
//  ViewController.swift
//  DreamDestination
//
//  Created by Максим Назаров on 13.02.2025.
//

import UIKit

final class FilterViewController: UIViewController {
    
    @IBOutlet weak var daysSlider: UISlider!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet var switches: [UISwitch]!
    @IBOutlet weak var budgetTextField: UITextField!
    
    private var preferredVacationType: [VacationType] = []
    private var suitableCountries: [Country] = []
    
    private let countries = Country.getCountries()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        budgetTextField.delegate = self
        daysSlider.minimumValue = 1
        daysSlider.maximumValue = 20
        resultButton.isEnabled = false
        
        budgetTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultTableVC = segue.destination as? ResultTableViewController
        resultTableVC?.suitableCountries = suitableCountries
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @objc func textFieldDidChange() {
        if let text = budgetTextField.text, !text.isEmpty {
            resultButton.isEnabled = true
        } else {
            resultButton.isEnabled = false
            showAlert(withTitle: "💸", andMessage: "Пожалуйста, укажите ваш бюджет на человека в рублях")        }
    }
    
    @IBAction func sliderDidSlide() {
        daysLabel.text = String(format: "%.F", daysSlider.value)
    }
    
    
    @IBAction func ResultButtonTapped(_ sender: UIButton) {
        checkSwitches()
        
        let userAnswer = UserAnswer(
            budget: Double(budgetTextField.text ?? "0") ?? 0,
            vacationDays: Int(daysSlider.value),
            preferredClimate: Climate(rawValue: (segmentedControl.selectedSegmentIndex)) ?? Climate.temperate,
            preferredVacationType: preferredVacationType
        )
        suitableCountries = UserAnswer.findSuitableCountries(for: userAnswer, from: countries)
    }
    
    private func checkSwitches(){
        for vocationSwitch in switches {
            switch vocationSwitch.tag {
            case 0:
                vocationSwitch.isOn ? preferredVacationType.append(.beach) : nil
            case 1:
                vocationSwitch.isOn ? preferredVacationType.append(.cultural) : nil
            case 2:
                vocationSwitch.isOn ? preferredVacationType.append(.adventure) : nil
            default:
                vocationSwitch.isOn ? preferredVacationType.append(.active) : nil
            }
        }
    }
    
    
    private func showAlert(withTitle title: String, andMessage message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            textField?.becomeFirstResponder()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


extension FilterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: textField,
            action: #selector(resignFirstResponder)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}

