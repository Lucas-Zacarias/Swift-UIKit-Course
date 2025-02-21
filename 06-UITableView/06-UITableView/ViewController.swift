//
//  ViewController.swift
//  06-UITableView
//
//  Created by Lucas Zacarias on 21/02/2025.
//

import UIKit

struct Device {
    let title: String
    let imageName: String
}
//UITableViewDataSource protocol to define sections and cells from table, create and configure each cell, supports edition and deleting of cells
//UITableViewDelegate protocol for handle user interactions with a UITableView, change cells size, config cells actions, reording
class ViewController: UIViewController {
    private let devicesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var dataSource: TableViewDataSource?
    private var delegate: TableViewDelegate?
    
    override func loadView() {
        let devicesTableView = UITableView()
        self.dataSource = TableViewDataSource(dataSource: allMyDevices)
        self.delegate = TableViewDelegate()
        devicesTableView.dataSource = dataSource
        devicesTableView.delegate = delegate
        devicesTableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCellView")
        view = devicesTableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.dataSource = TableViewDataSource(dataSource: house)
//        self.delegate = TableViewDelegate()
//        
//        devicesTableView.backgroundColor = .blue
//        devicesTableView.dataSource = dataSource
//        devicesTableView.delegate = delegate
//        //default way
//        devicesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableCellView")
//        //custom way
//        devicesTableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCellView")
//        
//        view.addSubview(devicesTableView)
//        
//        NSLayoutConstraint.activate([
//            devicesTableView.topAnchor.constraint(equalTo: view.topAnchor),
//            devicesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            devicesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            devicesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
    }

}

