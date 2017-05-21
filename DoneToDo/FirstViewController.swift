//
//  FirstViewController.swift
//  DoneToDo
//
//  Created by Sam on 15/05/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController {

	var fetchResult: [Any] = UserDefaults.standard.array(forKey: "ToDoObject") ?? []
	
	@IBOutlet var todoTableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return fetchResult.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "todoCellID") as? TodoViewCell, let todo = UserDefaults.standard.array(forKey: "ToDoObject")?[indexPath.row] as? [String: Any] else {
			return UITableViewCell()
		}
		
		print("todo object \(todo)")
		
		guard let name = todo["name"] as? String, let date = todo["dueDate"] as? Date, let priority = todo["priority"] as? String else {
			return UITableViewCell()
		}
		
		
		cell.todoName.text = name
		cell.todoTime.text = date.description
		cell.todoPriority.text = priority
		
		return cell
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}

class TodoViewCell: UITableViewCell {
	@IBOutlet weak var todoName: UILabel!
	@IBOutlet weak var todoTime: UILabel!
	@IBOutlet weak var todoPriority: UILabel!
	
}

