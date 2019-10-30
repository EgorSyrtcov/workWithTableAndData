//
//  Task.swift
//  WorkWithData
//
//  Created by Egor Syrtcov on 10/28/19.
//  Copyright © 2019 Egor Syrtcov. All rights reserved.
//

//import Foundation
import RealmSwift

@objcMembers
class Task: Object {
    dynamic var name = ""
    
    override var description: String {
        return "name - \(name)"
    }
}

