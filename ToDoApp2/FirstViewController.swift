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

class FirstViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    //最初からあるコード
    override func viewDidLoad() {
        super.viewDidLoad()
        todos = loadTodos() ?? [TodoKobetsunonakami]()
    }
    
    //最初からあるコード
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        todos = loadTodos() ?? [TodoKobetsunonakami]()
        self.tableView.reloadData()
    }
    
    @IBAction func tapDoneButtonAction(_ sender: UIButton) {
        let point = tableView.convert(sender.frame.origin, from: sender.superview)
        if let indexPath = self.tableView.indexPathForRow(at: point) {
            print(indexPath.row)
            let todo = todos.filter{ !$0.done }[indexPath.row]
            todo.done = true
            UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: todos), forKey: "TodoList")
            
            // tableViewを更新
            tableView.reloadData()
        }
    }
}


extension FirstViewController: UITableViewDelegate,UITableViewDataSource{
    //UITableView、numberOfRowsInSectionの追加(表示するcell数を決める)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return todos.filter{ !$0.done }.count
    }
    //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //変数を作る
        guard let todoCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as? cellTableViewCell  else {
            fatalError("The dequeued cell is not an instance of cellTableViewCell.")
        }
        //変数の中身を作る
        todoCell.label.text = todos.filter{ !$0.done }[indexPath.row].todotext
        //戻り値の設定（表示する中身)
        return todoCell
    }
    
    //セルの削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let removeTargetTodo = todos[indexPath.row]
            todos.removeAll { (todo) -> Bool in
                return todo == removeTargetTodo
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
            UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: todos), forKey: "TodoList")
        }
    }

}
