//
//  ViewController.swift
//  UnitTestFirstDemo
//
//  Created by 변재우 on 20190415//.
//  Copyright © 2019 변재우. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	func numberOfVowels (in string: String) -> Int {
		let vowels: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
		
		var numberOfVowels = 0
		for character in string {
			if vowels.contains(character) {
				numberOfVowels += 1
			}
		}
		return numberOfVowels
	}
	
	func makeHeadline(from string: String) -> String {
		let words = string.components(separatedBy: " ")
		
		let headlineWords = words.map { (word) -> String in
			var mutableWord = word
			let first = mutableWord.remove(at: mutableWord.startIndex)

			return String(first).uppercased() + mutableWord
		}
		return headlineWords.joined(separator: " ")
	}

}

