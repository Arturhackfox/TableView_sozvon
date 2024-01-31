//
//  DetailView.swift
//  TableView_sozvon
//
//  Created by Arthur Sh on 29.01.2024.
//

import UIKit


class DetailView: UIViewController {
    
    var model: Model? {
        didSet {
            guard let model else { return }
            name.text = model.name
            age.text = String(describing: model.age)
        }
    }
    
    
    private lazy var name: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 50, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var age: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 50, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setupHierarchy() {
        view.addSubview(name)
        view.addSubview(age)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            // только по 2 констрейнта ибо uilabel автоматом задаст высоту и ширину как сам текст и его размер
            name.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // только по 2 констрейнта ибо uilabel автоматом задаст высоту и ширину как сам текст и его размер
            age.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            age.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}

