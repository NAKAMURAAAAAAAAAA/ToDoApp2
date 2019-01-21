//
//  SecondViewController.swift
//  ToDoApp2
//
//  Created by Kan Nakamura on 2019/01/18.
//  Copyright © 2019 Kan Nakamura. All rights reserved.
//

import UIKit

//クラスの設置
class TodoKobetsunonakami: NSObject, NSCoding{
    //オプショナル型　var 変数名: 型名!
    var todotext: String!
    var done: Bool!
    //イニシャライザの宣言　init(引数: 型, 引数: 型 ){self.引数 = 引数}
    init(todotext: String, done: Bool) {
        self.todotext = todotext
        self.done = done
    }
    
    //userdefault使うときのイニシャライザ？？
    required init?(coder aDecoder: NSCoder) {
        self.todotext = (aDecoder.decodeObject(forKey: "todotext") as! String)
        self.done = aDecoder.decodeBool(forKey: "done")
    }
    
    func encode(with aCoder: NSCoder) {
        if let todotext = todotext { aCoder.encode(todotext, forKey: "todotext") }
        if let done = done { aCoder.encode(done, forKey: "done") }
    }
}

class SecondViewController: UIViewController {
    
    //テキストフィールドの設定
    @IBOutlet weak var TodoTextField: UITextField!

    //追加ボタンの設定
    @IBAction func TodoAddButton(_ sender: Any) {
        let todo = TodoKobetsunonakami(todotext: TodoTextField.text!, done: false)
        //swiftで配列に入れる。atは配列の順番
        todos.insert(todo, at: 0)
        //UserDefaultに保存
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: todos), forKey: "TodoList")
        TodoTextField.text = ""
    }
    
    //最初からあるコード
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //最初からあるコード
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
