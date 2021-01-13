//
//  DetailViewController.swift
//  ToDo
//
//  Created by 변재우 on 20190515//.
//  Copyright © 2019 변재우. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
	
	@IBOutlet var mapView: MKMapView!
	
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var dateLabel: UILabel!
	@IBOutlet var locationLabel: UILabel!
	@IBOutlet var detailLabel: UILabel!
	
	var itemInfo: (ItemManager, Int)?
	
	let dateFormatter: DateFormatter = {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "MM/dd/yyyy"
		return dateFormatter
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		guard let itemInfo = itemInfo else { return }
		let item = itemInfo.0.item(at: itemInfo.1)
		titleLabel.text = item.title
		locationLabel.text = item.location?.name
		detailLabel.text = item.itemDescription
		
		if let timestamp = item.timestamp {
			let date = Date(timeIntervalSince1970: timestamp)
			dateLabel.text = dateFormatter.string(from: date)
		}
		
		if let coordinate = item.location?.coordinate {
			let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
			mapView.region = region
		}
		
	}
	
	func checkItem() {
		if let itemInfo = itemInfo{
			itemInfo.0.checkItem(at: itemInfo.1)
		}
	}

}
