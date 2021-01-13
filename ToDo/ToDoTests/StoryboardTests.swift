//
//  StoryboardTests.swift
//  ToDoTests
//
//  Created by 변재우 on 20190716//.
//  Copyright © 2019 변재우. All rights reserved.
//

import XCTest
@testable import ToDo

class StoryboardTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
	
	func test_InitialViewController_IsItemListViewController() {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
		let rootViewController = navigationController.viewControllers[0]
		XCTAssertTrue(rootViewController is ItemListViewController)
	}

}
