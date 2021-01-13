//
//  UnitTestFirstDemoTests.swift
//  UnitTestFirstDemoTests
//
//  Created by 변재우 on 20190415//.
//  Copyright © 2019 변재우. All rights reserved.
//

import XCTest
@testable import UnitTestFirstDemo

class UnitTestFirstDemoTests: XCTestCase {
	
	var viewController: ViewController!
	
	override func setUp() {
		super.setUp()
		viewController = ViewController()
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func test_NumberOfVowels_WhenPassedJaewoo_ReturnsFour() {
		let string = "Jaewoo"
		let numberOfVowels = viewController.numberOfVowels(in: string)
		
		XCTAssertEqual(numberOfVowels, 4, "Should find 4 vowels in Jaewoo" )
	}
	
	func test_MakeHeadline_ReturnStringWithEachWordStartCapital() {
		let input				= "this is A test headline"
		let expectedOutput	= "This Is A Test Headline"
		
		let headline = viewController.makeHeadline(from: input)
		
		XCTAssertEqual(headline, expectedOutput)
	}
	
	func test_MakeHeadline_ReturnsStringWithEachWordStartCapital2() {
		let input 				= "Here is another Example"
		let expectedOutput	= "Here iS Another Example"
		
		let headline = viewController.makeHeadline(from: input)
		
		XCTAssertEqual(headline, expectedOutput)
	}
	
	func testPerformanceExample() {
		// This is an example of a performance test case.
		self.measure {
			// Put the code you want to measure the time of here.
		}
	}
	
}
