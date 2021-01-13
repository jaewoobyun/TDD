//
//  ItemListViewController.swift
//  ToDo
//
//  Created by 변재우 on 20190508//.
//  Copyright © 2019 변재우. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
	
	let itemManager = ItemManager()
	
	//	var tableView: UITableView?
	@IBOutlet var tableView: UITableView!
	
	@IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate & ItemManagerSettable)!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.dataSource = dataProvider
		tableView.delegate = dataProvider
		dataProvider.itemManager = itemManager
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		tableView.reloadData()
	}
	
	@IBAction func addItem(_ sender: AnyObject) {
		if let nextViewController = storyboard?.instantiateViewController(withIdentifier: "InputViewController") as? InputViewController {
			nextViewController.itemManager = itemManager
			present(nextViewController, animated: true, completion: nil)
		}
		
		
	}
	
}
