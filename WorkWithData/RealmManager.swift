//
//  SaveManager.swift
//  WorkWithData
//
//  Created by Egor Syrtcov on 10/28/19.
//  Copyright © 2019 Egor Syrtcov. All rights reserved.
//

import RealmSwift

protocol DBManager {
    
    func saveData(_ task: Task)
    
    func readData() -> [Task]
    
    func deleteData(_ task: Task)
    
    func clearAll()
}



class RealmManager: DBManager {
    
    var realm = try! Realm()
    
    func saveData(_ task: Task) {
        try! realm.write {
            realm.add(task)
        }
    }
    
   func readData() -> [Task] {
        let model = realm.objects(Task.self)
        return Array(model)
    }
    
    func deleteData(_ task: Task) {
        try! realm.write {
            realm.delete(task)
        }
    }
    
    func clearAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }
}
