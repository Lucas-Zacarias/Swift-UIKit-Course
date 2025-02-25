//
//  ViewController.swift
//  12-UICollectionView-DiffableDataSource-CompositionalLayout
//
//  Created by Lucas Zacarias on 25/02/2025.
//

import UIKit

struct Device: Hashable {
    let id: UUID = UUID()
    let title: String
    let imageName: String
}

let house = [
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3"),
    Device(title: "Pantallas", imageName: "display.2"),
    Device(title: "Apple TV", imageName: "appletv")
]

let office = [
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3")
]

class ViewController: UIViewController {
    private lazy var mCollectionView: UICollectionView = {
//       First set the configuration
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
//       Second set the layout and set the previous configuration
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
//       Finally create the collectionview and set the layout
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var mDataSource: UICollectionViewDiffableDataSource<Int, Device> = {
        let deviceCell = UICollectionView.CellRegistration<UICollectionViewListCell, Device> { cell, indexPath, model in
            var listContentConfiguration = UIListContentConfiguration.cell()
            listContentConfiguration.text = model.title
            listContentConfiguration.image = UIImage(systemName: model.imageName)
            cell.contentConfiguration = listContentConfiguration
        }
        
        let dataSource = UICollectionViewDiffableDataSource<Int, Device>(collectionView: mCollectionView) { collectionView, indexPath, model in
            return self.mCollectionView.dequeueConfiguredReusableCell(using: deviceCell, for: indexPath, item: model)
        }
        
        return dataSource
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.addSubview(mCollectionView)
        
        NSLayoutConstraint.activate([
            mCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            mCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        var snapshot = mDataSource.snapshot()
        snapshot.appendSections([0, 1])
        snapshot.appendItems(house, toSection: 0)
        snapshot.appendItems(office, toSection: 1)
        
        mDataSource.apply(snapshot)
        
//        Wait 2 seconds and after that execute adding two new items, one per section
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            snapshot.appendItems([.init(title: "New Device S1", imageName: "laptopcomputer")], toSection: 0)
            snapshot.appendItems([.init(title: "New Device S2", imageName: "appletv")], toSection: 1)
            
            self.mDataSource.apply(snapshot)
        }
    }

}

