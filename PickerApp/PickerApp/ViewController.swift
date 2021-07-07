//
//  ViewController.swift
//  PickerApp
//
//  Created by Admin on 07.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var genderTextField: UITextField!
    @IBOutlet private weak var calendarTextField: UITextField!
    
    @IBOutlet private weak var avatarImage: UIView!
    
    private let genderData = ["Female", "Male", "Unknown"]
    private let genderPicker: UIPickerView = UIPickerView()
    private let calendarPicker: UIDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarImage.layer.cornerRadius = avatarImage.frame.height/2
        
        genderPicker.dataSource = self
        genderPicker.delegate = self
        
        calendarPicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
        calendarPicker.datePickerMode = UIDatePicker.Mode.date
        calendarPicker.date = Date()
        calendarPicker.maximumDate = Date()
        calendarPicker.minimumDate = Calendar.current.date(byAdding: .year, value: -100, to: Date())
        calendarPicker.addTarget(self, action: #selector(datePickerChanged(picker:)),
                                 for: UIControl.Event.valueChanged)
        
        genderTextField.inputView = genderPicker
        calendarTextField.inputView = calendarPicker
    }
    @objc func datePickerChanged(picker: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        calendarTextField.text = formatter.string(from: picker.date)
        print(picker.date)
    }
    @IBAction func onCLickGenderPicker(_ sender: Any) {
        if genderTextField.isFirstResponder {
            genderTextField.resignFirstResponder()
        } else {
            genderTextField.becomeFirstResponder()
        }
    }
    @IBAction func onClickDateOfBirthPicker(_ sender: Any) {
        if calendarTextField.isFirstResponder {
            calendarTextField.resignFirstResponder()
        } else {
            calendarTextField.becomeFirstResponder()
        }
    }
}
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderData.count
    }
}
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return genderData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderTextField.text = genderData[row]
    }
}



