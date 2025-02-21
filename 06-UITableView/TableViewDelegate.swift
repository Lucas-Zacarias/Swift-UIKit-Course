//
//  TableViewDelegate.swift
//  06-UITableView
//
//  Created by Lucas Zacarias on 21/02/2025.
//

import Foundation
import UIKit

final class TableViewDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = allMyDevices[indexPath.section][indexPath.row]
        print(model.title)
        
        //bug fixed when a cell is selected it doesnt deselected visually
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
