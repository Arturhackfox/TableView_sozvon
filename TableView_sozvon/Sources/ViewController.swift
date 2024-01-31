//
//  ViewController.swift
//  TableView_sozvon
//
//  Created by Arthur Sh on 29.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var array: [[Model]] = [
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
        table.delegate = self
        table.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier) // какой это будет тип ? и какой айди
        table.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: CustomHeader.identifier)
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


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell
        let data = array[indexPath.section][indexPath.row]  /// передаём данные с первой секции первой ячейки ЗАПУСТИТЬСЯ ЗАНОВО ПОСЛЕ ПРИСВОЕННИЯ ДАННЫХ столько раз сколько есть ячеек
        cell?.model = data
        
        // MARK: изминение цвета ячеек
        
        if indexPath.section == 0 && indexPath.row == 0 {
            cell?.backgroundColor = .cyan
        }
        
        return cell ?? UITableViewCell()
    }
    
    // MARK: Header
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "First section header"
//        } else {
//            return "Other section header"
//        }
//    }
    
    // MARK: Footer
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "First section footer"
        } else {
            return "Other section footer"
        }
    }
    
    // MARK: Delegate
    // MARK: Custom headers
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomHeader.identifier) as? CustomHeader
        
        if section == 0 {
            header?.configureHeader(image: "heart", text: "This is First Header")
            return header
        } else {
            header?.configureHeader(image: "globe", text: "Other headers")
            return header
        }
    }
    // AUTO ROW HEIGHT
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 30
        } else {
            return UITableView.automaticDimension
        }
    }
    
    // MARK: - что делать при нажатиях на конкретную ячейку
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("нажал на \(indexPath.row)")
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = DetailView()
        let data = array[indexPath.section][indexPath.row]
        vc.model = data
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            array[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
}

