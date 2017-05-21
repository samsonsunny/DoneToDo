//
//  MainTabBarController.swift
//  DoneToDo
//
//  Created by Sam on 15/05/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationItem.title = "Todo"
	}
	
	override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
		if item.tag == 0 {
			self.navigationItem.title = "Todo"
		}else {
			self.navigationItem.title = "Done"
		}
	}
	@IBAction func addToDo(_ sender: Any) {
		guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "createToDo") as? CreateToDoViewController else {
			return
		}
		
		let navController = UINavigationController(rootViewController: viewController)
		
		self.navigationController?.present(navController, animated: true, completion: nil)
	}
}
