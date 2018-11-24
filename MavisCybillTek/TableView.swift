//
//  TableView.swift
//  MavisCybillTek
//
//  Created by Tzu-Yen Huang on 2018/11/24.
//  Copyright © 2018年 Tzu-Yen Huang. All rights reserved.
//

import UIKit
import CoreData

class TableView: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var personList:[Person] = []
    @IBOutlet var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        cell.textLabel?.text = personList[indexPath.row].lastName + " " + personList[indexPath.row].firstName
        return cell
    }
    
    //send Person to next page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let next = segue.destination as! ContentController
            next.person = personList[tableView.indexPathForSelectedRow!.row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        PersonDAO.getPersonDataFromCoreData(list: &personList)
    }
}
