//
//  MainTableViewDataSource.swift
//  CustomTransitionDemo
//
//  Created by 王俊硕 on 2017/10/11.
//  Copyright © 2017年 王俊硕. All rights reserved.
//

import UIKit 

extension MainTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return cellsData.count
    }
    
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! JSTableViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
//        cell.sepe
        let data = cellsData[indexPath.section]
        cell.setup(title: data.title, subtitle: data.subtitle, imageName: data.image, description: data.description)

        return cell
    }
   
}
