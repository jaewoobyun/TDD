//
//  ItemCellTests.swift
//  ToDoTests
//
//  Created by 변재우 on 20190513//.
//  Copyright © 2019 변재우. All rights reserved.
//

import XCTest
@testable import ToDo

class ItemCellTests: XCTestCase {
	
	var tableView: UITableView!
	let dataSource = FakeDataSource()
	var cell: ItemCell!

    override func setUp() {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let controller = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
		
		controller.loadViewIfNeeded()
		
		tableView = controller.tableView
		tableView.dataSource = dataSource
		
		cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: IndexPath(row: 0, section: 0)) as! ItemCell
    }

    override func tearDown() {
		
    }
	
	func test_HasNameLabel() {
//		let storyboard = UIStoryboard(name: "Main", bundle: nil)
//		let controller = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
//
//		controller.loadViewIfNeeded()
//
//		let tableView = controller.tableView
//		let dataSource = FakeDataSource()
//		tableView?.dataSource = dataSource
//
//		let cell = tableView?.dequeueReusableCell(withIdentifier: "ItemCell", for: IndexPath(row: 0, section: 0)) as! ItemCell
		
//		XCTAssertNotNil(cell.titleLabel)
		XCTAssertTrue(cell.titleLabel.isDescendant(of: cell.contentView))
	}
	
	func test_HasLocationLabel() {
//		let storyboard = UIStoryboard(name: "Main", bundle: nil)
//		let controller = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
//
//		controller.loadViewIfNeeded()
//
//		let tableView = controller.tableView
//		let dataSource = FakeDataSource()
//		tableView?.dataSource = dataSource
//
//		let cell = tableView?.dequeueReusableCell(withIdentifier: "ItemCell", for: IndexPath(row: 0, section: 0)) as! ItemCell

		XCTAssertTrue(cell.locationLabel.isDescendant(of: cell.contentView))
	}
	
	func test_HasDateLabel() {
		XCTAssertTrue(cell.dateLabel.isDescendant(of: cell.contentView))
	}
	
	func test_ConfigCell_SetsTitle() {
		cell.configCell(with: ToDoItem(title: "Foo"))
		
		XCTAssertEqual(cell.titleLabel.text, "Foo")
	}
	
	func test_ConfigCell_SetsDate() {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "MM/dd/yyyy"
		let date = dateFormatter.date(from: "05/13/2019")
		let timestamp = date?.timeIntervalSince1970
		cell.configCell(with: ToDoItem(title: "Foo", timestamp: timestamp))
		
		XCTAssertEqual(cell.dateLabel.text, "05/13/2019")
	}
	
	func test_ConfigCell_SetsLocation() {
		let mylocation = Location(name: "Home")
		
		cell.configCell(with: ToDoItem(title: "Foo",
												 location: mylocation))
		XCTAssertEqual(cell.locationLabel.text, "Home")
	}
	
	func test_Title_WhenItemIsChecked_IsStrokeThrough() {
		let location = Location(name: "Bar")
		let item = ToDoItem(title: "Foo", itemDescription: nil, timestamp: 1456150025, location: location)
		
		cell.configCell(with: item, checked: true)
		
		let attributedString = NSAttributedString(string: "Foo", attributes: [NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue])
		
		XCTAssertEqual(cell.titleLabel.attributedText, attributedString)
		XCTAssertNil(cell.locationLabel.text)
		XCTAssertNil(cell.dateLabel.text)
	}
	
	

}

extension ItemCellTests {
	
	class FakeDataSource: NSObject, UITableViewDataSource {
		
		func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
			return 1
		}
		
		func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
			return UITableViewCell()
		}
		
	}
}
