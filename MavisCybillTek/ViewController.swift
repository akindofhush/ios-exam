//
//  ViewController.swift
//  MavisCybillTek
//
//  Created by Tzu-Yen Huang on 2018/11/23.
//  Copyright © 2018年 Tzu-Yen Huang. All rights reserved.
//

import UIKit
import CoreData

import UIKit
import CoreData

class ViewController: UIViewController {
    var personList:[Person] = []
    @IBOutlet var clickButton: UIButton!
    @IBOutlet var loadingStatus: UIActivityIndicatorView!
    
    @objc func clickStatus(noti:Notification){
        clickButton.setTitleColor(.black, for: .normal)
        clickButton.isEnabled = true
        loadingStatus.stopAnimating()
        loadingStatus.hidesWhenStopped = true
        task.cancel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingStatus.startAnimating()
        clickButton.setTitleColor(.gray, for: .normal)
        clickButton.isEnabled = false
        NotificationCenter.default.addObserver(self, selector: #selector(clickStatus(noti:)), name: NSNotification.Name("Finish"), object: nil)
        PersonDAO.getPersonData()
        //cover the data with the same constraints data
        let container = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
        container.loadPersistentStores { storeDescription, error in
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            
            if let error = error {
                print("Unresolved error \(error)")
            }
        }
        PersonDAO.getPersonDataFromCoreData(list: &personList)
        if personList.count == 0 {
            
        }
        
    }
}


