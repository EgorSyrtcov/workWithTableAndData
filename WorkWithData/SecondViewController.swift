//
//  SecondViewController.swift
//  WorkWithData
//
//  Created by Egor Syrtcov on 27/10/2019.
//  Copyright © 2019 Egor Syrtcov. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController {
    
    var completion: ((String) -> ())?
    
    let mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.textAlignment = .center
        mainLabel.text = "Новая задача"
        mainLabel.font = UIFont.systemFont(ofSize: 25)
        return mainLabel
    }()
    
    let newTaskTextField: UITextField = {
        let newTaskTextField = UITextField()
        newTaskTextField.placeholder = "new task"
        newTaskTextField.font = UIFont.systemFont(ofSize: 20)
        newTaskTextField.borderStyle = .roundedRect
        return newTaskTextField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        assemble()
        setupLayout()
        addSaveButtonNavigationBar()
    }
    
    fileprivate func addSaveButtonNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(tapSaveButton))
    }
    
    @objc func tapSaveButton() {
        guard let newTask = newTaskTextField.text, newTask.isEmpty == false else { return}
        completion!(newTask)
        navigationController?.popViewController(animated: true)
    }
    
    fileprivate func assemble() {
        view.addSubview(mainLabel)
        view.addSubview(newTaskTextField)
    }
    
    fileprivate func setupLayout() {
        mainLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.topMargin.equalToSuperview().offset(30)
        }
        newTaskTextField.snp.makeConstraints { (make) in
            make.top.equalTo(mainLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
    }
}
