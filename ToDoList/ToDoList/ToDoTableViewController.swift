//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Barsha Parajuli on 7/20/21.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    var listOfToDo : [ToDoClass] = []
    func createToDo() -> [ToDoClass]{
        let swiftToDo = ToDoClass()
        swiftToDo.description = "Learn Swift"
        swiftToDo.important = true
        
        let decorToDo = ToDoClass()
        decorToDo.description = "Decorate Room"
        
        return[swiftToDo, decorToDo]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        listOfToDo = createToDo()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfToDo.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let eachToDo = listOfToDo[indexPath.row]
        if eachToDo.important{
            cell.textLabel?.text = "❗️" + eachToDo.description
        }else{
            cell.textLabel?.text = "❕" + eachToDo.description
        }
        // Configure the cell...

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let nextAddToDoVC = segue.destination as? AddToDoViewController {
              nextAddToDoVC.previousToDoTVC = self
         }
    }
}
