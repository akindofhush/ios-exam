//
//  ViewController.swift
//  MavisCybillTek
//
//  Created by Tzu-Yen Huang on 2018/11/23.
//  Copyright © 2018年 Tzu-Yen Huang. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        PersonDAO.getPersonData()
        //cover the data with the same constraints data
        let container = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
        container.loadPersistentStores { storeDescription, error in
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            
            if let error = error {
                print("Unresolved error \(error)")
            }
        }
        
    }
}

