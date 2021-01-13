//
//  ItemListViewControllerTest.swift
//  ToDoTests
//
//  Created by 변재우 on 20190508//.
//  Copyright © 2019 변재우. All rights reserved.
//

import XCTest
@testable import ToDo

class ItemListViewControllerTest: XCTestCase {
	
	var sut: ItemListViewController!
//	let itemManager = ItemManager()

    override func setUp() {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let viewController = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
		sut = viewController as! ItemListViewController
		
		XCTAssertNil(sut.presentedViewController)
		guard let addButton = sut.navigationItem.rightBarButtonItem else { XCTFail(); return }
		guard let action = addButton.action else { XCTFail(); return }
		UIApplication.shared.keyWindow?.rootViewController = sut
		
		sut.performSelector(onMainThread: action, with: addButton, waitUntilDone: true)
		
		
		sut.loadViewIfNeeded()
    }

    override func tearDown() {
		
    }
	
	
	func test_TableView_AfterViewDidLoad_IsNotNil() {
		XCTAssertNotNil(sut.tableView)
	}
	
	func test_LoadingView_SetsTableViewDataSource() {
		XCTAssertTrue(sut.tableView.dataSource is ItemListDataProvider)
	}
	
	func test_LoadingView_SetsTableViewDelegate() {
		XCTAssertTrue(sut.tableView.delegate is ItemListDataProvider)
	}
	
	func test_LoadingView_DataSourceEqualDelegate() {
		XCTAssertEqual(sut.tableView.dataSource as? ItemListDataProvider,
							sut.tableView.delegate as? ItemListDataProvider)
	}
	
	func test_ItemListViewController_HasAddBarButtonWithSelfAsTarget() {
		let target = sut.navigationItem.rightBarButtonItem?.target
		XCTAssertEqual(target as? UIViewController, sut)
	}
	
	func test_AddItem_PresentsAddItemViewController() {
//		XCTAssertNil(sut.presentedViewController)
//		guard let addButton = sut.navigationItem.rightBarButtonItem else { XCTFail(); return }
//		guard let action = addButton.action else { XCTFail(); return }
//		UIApplication.shared.keyWindow?.rootViewController = sut
//
//		sut.performSelector(onMainThread: action, with: addButton, waitUntilDone: true)
		
		XCTAssertNotNil(sut.presentedViewController)
		XCTAssertTrue(sut.presentedViewController is InputViewController)
		
		let inputViewController = sut.presentedViewController as! InputViewController
		XCTAssertNotNil(inputViewController.titleTextField)
		
	}
	
	func test_ItemListVC_SharesItemManagerWithInputVC() {
//		guard let addButton = sut.navigationItem.rightBarButtonItem else { XCTFail(); return }
//		guard let action = addButton.action else { XCTFail(); return }
//		UIApplication.shared.keyWindow?.rootViewController = sut
//		sut.performSelector(onMainThread: action, with: addButton, waitUntilDone: true)
		guard let inputViewController = sut.presentedViewController as? InputViewController else { XCTFail(); return }
		guard let inputItemManager = inputViewController.itemManager else { XCTFail(); return }
		
		XCTAssertTrue(sut.itemManager === inputItemManager)
		
	}
	
	func test_ViewDidLoad_SetsItemManagerToDataProvider() {
		XCTAssertTrue(sut.itemManager === sut.dataProvider.itemManager)
	}
	
	func test_TableView_isReloadedWhenItemIsAdded() {
		
		sut.beginAppearanceTransition(true, animated: true)
		sut.endAppearanceTransition()
		
		
		
		//XCTAssertEqual(<#T##expression1: Equatable##Equatable#>, <#T##expression2: Equatable##Equatable#>)
		
	}

	

}

extension ItemListViewController {
	class MockTableView: UITableView {
		var cellGotDequeued = false
		
		override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
			cellGotDequeued = true
			
			return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
		}
		
		
	}
}
