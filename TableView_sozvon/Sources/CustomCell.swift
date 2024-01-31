//
//  TableViewCell.swift
//  TableView_sozvon
//
//  Created by Arthur Sh on 29.01.2024.
//

import UIKit

class CustomCell: UITableViewCell {
    
    static let identifier = "CustomCell"
    
    var model: Model? {
        didSet {
            guard let model else { return }
            name.text = model.name
            container.age.text = String(describing: model.age)
        }
    }
    
    
    private lazy var name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var age: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = .black
        
        return label
    }()
  
    private lazy var container: CustomNameAndAge = {
        let container = CustomNameAndAge()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        return container
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: CustomCell.identifier) // здесь меняется стиль самой ячейки
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: Setup
    
    private func setupHierarchy() {
        addSubview(name)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([

            name.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            name.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
            
        ])
        
    }
    
    
}



// отобразить все полученые имена и age


class CustomNameAndAge: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    var name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    var age: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    
    private func setupHierarchy() {
        [name, age].forEach { addSubview($0)}
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            name.centerYAnchor.constraint(equalTo: centerYAnchor),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            
            age.centerYAnchor.constraint(equalTo: centerYAnchor),
            age.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),

        ])
    }
}
