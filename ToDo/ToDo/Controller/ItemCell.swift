//
//  ItemCell.swift
//  ToDo
//
//  Created by 변재우 on 20190510//.
//  Copyright © 2019 변재우. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
	//let titleLabel = UILabel()
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var locationLabel: UILabel!
	@IBOutlet var dateLabel: UILabel!
	
	lazy var dateFormatter: DateFormatter = {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "MM/dd/yyyy"
		return dateFormatter
	}()
	
	func configCell(with item: ToDoItem, checked: Bool = false) {
//		titleLabel.text = item.title
//
//		if let timestamp = item.timestamp {
//			let date = Date(timeIntervalSince1970: timestamp)
////			let dateFormatter = DateFormatter()
////			dateFormatter.dateFormat = "MM/dd/yyyy"
//			dateLabel.text = dateFormatter.string(from: date)
//		}
//
//		locationLabel.text = item.location?.name
//
		if checked {
			let attributedString = NSAttributedString(string: item.title, attributes: [NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue])
			titleLabel.attributedText = attributedString
			locationLabel.text = nil
			dateLabel.text = nil
		} else {
			titleLabel.text = item.title
			locationLabel.text = item.location?.name ?? ""
			if let timestamp = item.timestamp {
				let date = Date(timeIntervalSince1970: timestamp)
				dateLabel.text = dateFormatter.string(from: date)
			}
		}
	}
	

}
