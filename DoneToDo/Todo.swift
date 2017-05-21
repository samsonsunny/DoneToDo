//
//  Todo.swift
//  DoneToDo
//
//  Created by Sam on 20/05/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import Foundation
import CoreData

@objc(Todo)

class Todo: NSManagedObject {
	class func setTodo(_ todo1: [String: Any]) -> Todo {
		
		let todo = Todo()
		
		todo.createDate = todo1["createDate"] as? Date ?? Date()
		todo.dueDate	= todo1["dueDate"] as? Date ?? Date()
		todo.key		= "1232123123"
		todo.priority	= 3
		todo.text		= "Hello"
		
		return todo
	}
}

extension Todo {
	
	@NSManaged public var createDate: Date
	@NSManaged public var key: String
	@NSManaged public var dueDate: Date
	@NSManaged public var priority: Int32
	@NSManaged public var name: String
	@NSManaged public var text: String
	
}
