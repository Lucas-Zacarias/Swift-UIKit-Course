//
//  CustomUICollectionViewCell.swift
//  08-UICollectionView
//
//  Created by Lucas Zacarias on 23/02/2025.
//

import UIKit

class CustomUICollectionViewCell: UICollectionViewCell {
    private let mStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.borderColor = UIColor.black.cgColor
        stackView.layer.borderWidth = 1
        return stackView
    }()
    
    private let mImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let mLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super .init(frame: .zero)
        
        addSubview(mStackView)
        mStackView.addArrangedSubview(mImageView)
        mStackView.addArrangedSubview(mLabel)
        
        NSLayoutConstraint.activate([
            mStackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            mStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(device: Device) {
        mImageView.image = UIImage(systemName: device.imageName)
        mLabel.text = device.title
    }
    
}
