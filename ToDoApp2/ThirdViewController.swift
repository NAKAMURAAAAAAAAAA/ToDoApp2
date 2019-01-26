//
//  ThirdViewController.swift
//  ToDoApp2
//
//  Created by Kan Nakamura on 2019/01/18.
//  Copyright © 2019 Kan Nakamura. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        todos = loadTodos() ?? [TodoKobetsunonakami]()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        todos = loadTodos() ?? [TodoKobetsunonakami]()
        tableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ThirdViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.filter{ $0.done }.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoneCell") as! donecellTableViewCell
        cell.donelabel?.text = todos.filter{ $0.done }[indexPath.row].todotext
        return cell
    }
    
    
}
