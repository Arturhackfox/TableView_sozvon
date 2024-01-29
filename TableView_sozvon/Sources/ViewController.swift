//
//  ViewController.swift
//  TableView_sozvon
//
//  Created by Arthur Sh on 29.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let array: [[Model]] = [
        [
            Model(name: "Dima", age: 10),
            Model(name: "Arthur", age: 20)
        ],
        [
            Model(name: "Olya", age: 30),
            Model(name: "Denis", age: 40),
            Model(name: "Mark", age: 50)
        ]
    ]
    
    // MARK: - Ui
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.backgroundColor = .systemYellow
        table.dataSource = self // что бы передать управление данными таблицы на ViewController
        table.register(CustomCell.self, forCellReuseIdentifier: "CustomCell") // какой это будет тип ? и какой айди
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
}


extension ViewController: UITableViewDataSource {
    
    // MARK: - number of rows
    
    func numberOfSections(in tableView: UITableView) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array[section].count
    }
    
    // MARK: -  как будут выглядеть сами ячейки
    /// index path - путь к ячейки (там спрятаны координаты ячейки section & row)
    /// у 3 ячейки section = 0 & row = 2
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell
        let data = array[indexPath.section][indexPath.row]  /// передаём данные с первой секции первой ячейки ЗАПУСТИТЬСЯ ЗАНОВО ПОСЛЕ ПРИСВОЕННИЯ ДАННЫХ столько раз сколько есть ячеек
        cell?.textLabel?.text = data.name
        cell?.detailTextLabel?.text = "\(data.age)"
        
        return cell ?? UITableViewCell()
    }
    
}

