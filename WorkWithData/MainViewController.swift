//
//  ViewController.swift
//  WorkWithData
//
//  Created by Egor Syrtcov on 27/10/2019.
//  Copyright © 2019 Egor Syrtcov. All rights reserved.
//

import UIKit
import SnapKit
import RealmSwift

final class MainViewController: UIViewController {
    
    let mainManager: RealmManager = RealmManager()
    
    
    private struct Properties {
        static let сellReuseIdentifier = "CellId"
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: Properties.сellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addRightButtonNavigationBar()
        addLeftButtonNavigationBar()
        setupNavigationBar()
        assemble()
        setupLayout()
      
    }
    
    fileprivate func setupNavigationBar() {
        view.backgroundColor = .white
        title = "Задачи"
    }
    
    fileprivate func addRightButtonNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapAddButton))
    }
    
    
    @objc func tapAddButton() {
        let secondVC = SecondViewController()
        
        secondVC.completion = { [weak self] text in
            let task = Task()
            task.name = text
            self?.mainManager.saveData(task)
            self?.tableView.reloadData()
        }
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    fileprivate func addLeftButtonNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(tapTrashButton))
    }
    
    @objc func tapTrashButton() {
       mainManager.clearAll()
       self.tableView.reloadData()
    }
    

    
    fileprivate func assemble() {
        view.addSubview(tableView)
    }
    
    fileprivate func setupLayout() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainManager.readData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Properties.сellReuseIdentifier, for: indexPath) as! CustomTableViewCell
        let task = mainManager.readData()[indexPath.row]
        cell.nameLabel.text = task.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (_, _) in
            let task = self.mainManager.readData()[indexPath.row]
            self.mainManager.deleteData(task)
            
           tableView.deleteRows(at: [indexPath], with: .automatic)
        }
       return [deleteAction]
    }
}

