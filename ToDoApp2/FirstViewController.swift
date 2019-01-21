//
//  FirstViewController.swift
//  ToDoApp2
//
//  Created by Kan Nakamura on 2019/01/18.
//  Copyright © 2019 Kan Nakamura. All rights reserved.
//

import UIKit
//classの継承を追加
var todos = [TodoKobetsunonakami]()

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //アンアーカイブしてデータを開示
    func loadTodos() -> [TodoKobetsunonakami]?{
        if let loadedData = UserDefaults().data(forKey: "TodoList") {
            let todos = NSKeyedUnarchiver.unarchiveObject(with: loadedData) as! [TodoKobetsunonakami]
            return todos
        }else {
            return nil
        }
    }
    
    //UITableView、numberOfRowsInSectionの追加(表示するcell数を決める)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return todos.count
    }
    //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //変数を作る
        guard let TodoCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as? cellTableViewCell  else {
            fatalError("The dequeued cell is not an instance of cellTableViewCell.")
        }
        if todos.done == false{
        //変数の中身を作る
            TodoCell.label.text = todos[indexPath.row].todotext}
        else{
            DoneCell.donelabel.text = todos[indexPath.row].todotext
        }
        //戻り値の設定（表示する中身)
        return TodoCell
    }
    
    //セルの削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //最初からあるコード
    override func viewDidLoad() {
        super.viewDidLoad()
        todos = loadTodos() ?? [TodoKobetsunonakami]()
    }
    
    //最初からあるコード
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

