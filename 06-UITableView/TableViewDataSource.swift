//
//  TableViewDataSource.swift
//  06-UITableView
//
//  Created by Lucas Zacarias on 21/02/2025.
//

import Foundation
import UIKit

let house = [
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3"),
    Device(title: "Pantallas", imageName: "display.2"),
    Device(title: "Apple TV", imageName: "appletv")
]

let work = [
    Device(title: "iPhone", imageName: "iphone"),
    Device(title: "iPad", imageName: "ipad"),
    Device(title: "Airpods", imageName: "airpods"),
    Device(title: "Apple Watch", imageName: "applewatch"),
]

let allMyDevices = [house, work]

final class TableViewDataSource: NSObject, UITableViewDataSource {
    private let dataSource: [[Device]]
    
    init(dataSource: [[Device]]) {
        self.dataSource = dataSource
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
// withIdentifier --> verify its name matches with register in devicestableview one
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellView", for: indexPath) as! CustomCell
//      --> custom way <--
        let model = dataSource[indexPath.section][indexPath.row]
        cell.configure(model: model)
        
//        --> default way <--
//        var listContentConfiguration = UIListContentConfiguration.cell()
//        listContentConfiguration.text = model.title
//        listContentConfiguration.image = UIImage(systemName: model.imageName)
//
//        cell.contentConfiguration = listContentConfiguration
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Device House"
        } else {
            return "Device Work"
        }
    }
}
