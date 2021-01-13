//
//  ItemManager.swift
//  ToDo
//
//  Created by 변재우 on 20190424//.
//  Copyright © 2019 변재우. All rights reserved.
//

import Foundation

class ItemManager: NSObject {
	var toDoCount : Int { return toDoItems.count }
	var doneCount : Int { return doneItems.count }
	private var toDoItems: [ToDoItem] = []
	private var doneItems: [ToDoItem] = []
	
	func add(_ item: ToDoItem) {
//		toDoCount += 1
//		toDoItems.append(item)
		if !toDoItems.contains(item) {
			toDoItems.append(item)
		}
	}
	
	func item(at index: Int) -> ToDoItem {
		return toDoItems[index]
	}
	
	func checkItem(at index: Int) {
//		toDoCount -= 1
//		doneCount += 1
		let item = toDoItems.remove(at: index)
		doneItems.append(item)
	}
	
	func uncheckItem(at index: Int) {
		let item = doneItems.remove(at: index)
		toDoItems.append(item)
	}
	
	func doneItem(at index: Int) -> ToDoItem {
		return doneItems[index]
	}
	
	func removeAll() {
		toDoItems.removeAll()
		doneItems.removeAll()
	}
	
}
