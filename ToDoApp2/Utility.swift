//
//  Utility.swift
//  ToDoApp2
//
//  Created by 齋藤拓巳 on 2019/01/23.
//  Copyright © 2019 Kan Nakamura. All rights reserved.
//

import Foundation

//アンアーカイブしてデータを開示
func loadTodos() -> [TodoKobetsunonakami]?{
    if let loadedData = UserDefaults().data(forKey: "TodoList") {
        let todos = NSKeyedUnarchiver.unarchiveObject(with: loadedData) as! [TodoKobetsunonakami]
        return todos
    }else {
        return nil
    }
}
