//
//  CustomTableViewCell.swift
//  WorkWithData
//
//  Created by Egor Syrtcov on 10/30/19.
//  Copyright © 2019 Egor Syrtcov. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    

    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        //nameLabel.textAlignment = .center
        nameLabel.text = "Hello"
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        return nameLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        assemble()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
        
    
    
    fileprivate func assemble() {
        addSubview(nameLabel)
    }
    
    fileprivate func setupLayout() {
        nameLabel.snp.makeConstraints { (make) in
            make.left.top.bottom.right.equalToSuperview()
        }
    }

}
