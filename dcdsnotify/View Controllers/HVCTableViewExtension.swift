//
//  HVCTableViewExtension.swift
//  dcdsnotify
//
//  Created by Peter J. Lee on 8/26/16.
//  Copyright © 2016 orctech. All rights reserved.
//

import Foundation
import UIKit
extension HomeworkViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureRefresh() {
        self.tableView.addSubview(refreshControl)
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return activities?.list?.count ?? 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return activities?.list?[section].classString
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell") as! ActivityTableViewCell
        if activities != nil && activities!.list != nil
        {
            cell.activity = activities?.list?[indexPath.section]
        }
        else {
            cell.activity = Activity(classString: "", title: "", subtitle: "No Data")//TODO: change to "Refreshing automatically in \(count))
        }
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
