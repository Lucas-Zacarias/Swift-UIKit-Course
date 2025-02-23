//
//  ViewController.swift
//  08-UICollectionView
//
//  Created by Lucas Zacarias on 23/02/2025.
//

import UIKit

struct Device {
    let title: String
    let imageName: String
}

let house = [
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3"),
    Device(title: "Pantallas", imageName: "display.2"),
    Device(title: "Apple TV", imageName: "appletv"),
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3"),
    Device(title: "Pantallas", imageName: "display.2"),
    Device(title: "Apple TV", imageName: "appletv"),
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3"),
    Device(title: "Pantallas", imageName: "display.2"),
    Device(title: "Apple TV", imageName: "appletv")
]

class ViewController: UIViewController, UICollectionViewDataSource {
    private let mUICollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 200, height: 60)
        
        let uiCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        uiCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return uiCollectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mUICollectionView.backgroundColor = UIColor.clear
        mUICollectionView.dataSource = self
//        mUICollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        mUICollectionView.register(CustomUICollectionViewCell.self, forCellWithReuseIdentifier: "CustomUICollectionViewCell")
        view.backgroundColor = .blue
        view.addSubview(mUICollectionView)
        
        NSLayoutConstraint.activate([
            mUICollectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            mUICollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mUICollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mUICollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return house.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellView = mUICollectionView.dequeueReusableCell(withReuseIdentifier: "CustomUICollectionViewCell", for: indexPath) as! CustomUICollectionViewCell
        cellView.backgroundColor = .red
        
        let model = house[indexPath.row]
        
        cellView.configure(device: model)
        
//        var listContentConfiguration = UIListContentConfiguration.cell()
//        listContentConfiguration.text = model.title
//        listContentConfiguration.image = UIImage(systemName: model.imageName)
//        
//        cellView.contentConfiguration = listContentConfiguration
        
        return cellView
    }


}

