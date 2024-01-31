//
//  CustomHeader.swift
//  TableView_sozvon
//
//  Created by Arthur Sh on 29.01.2024.
//

import UIKit

class CustomHeader: UITableViewHeaderFooterView {
    static let identifier = "CustomHeader"
    
    private lazy var image: UIImageView = {
        let image = UIImage(systemName: "globe")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func setupHierarchy() {
        addSubview(image)
        addSubview(label)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            image.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            image.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    // 
    func configureHeader(image: String, text: String) {
        self.image.image = UIImage(systemName: image)
        label.text = text
    }

}

