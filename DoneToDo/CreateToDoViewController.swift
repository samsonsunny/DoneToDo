//
//  CreateToDoViewController.swift
//  DoneToDo
//
//  Created by Sam on 15/05/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit
import CoreData

class CreateToDoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
	
	@IBOutlet weak var toDoText: UITextView!
	@IBOutlet weak var dueDate: UIDatePicker!
	@IBOutlet weak var priority: UIPickerView!
	
	var selectedPriority = "Normal"
	let defaults = UserDefaults.standard
	let priorityArray = ["Very Important", "Important", "Normal", "Not Important"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		priority.dataSource = self
		priority.delegate = self
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		toDoText.becomeFirstResponder()
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
	@IBAction func closeView(_ sender: Any) {
		toDoText.resignFirstResponder()
		self.navigationController?.dismiss(animated: true, completion: nil)
	}
	
	@IBAction func saveEvent(_ sender: Any) {
		
		let event = ["name" : toDoText.text, "dueDate" : dueDate.date, "priority" : selectedPriority] as [String : Any]
		
		
		
		
		
		
//		guard var obj = defaults.object(forKey: "ToDoObject") as? [Any] else {
//			
//			defaults.set([event], forKey: "ToDoObject")
//			
//			defaults.synchronize()
//			
//			toDoText.resignFirstResponder()
//			self.navigationController?.dismiss(animated: true, completion: nil)
//			return
//		}
//		
//		obj.append(event)
//		
//		defaults.setValue(obj, forKey: "ToDoObject")
//		defaults.synchronize()
		
		toDoText.resignFirstResponder()
		self.navigationController?.dismiss(animated: true, completion: nil)
	}
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return priorityArray.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return priorityArray[row]
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		selectedPriority = priorityArray[row]
	}
}
