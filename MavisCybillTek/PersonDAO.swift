//
//  PersonDAO.swift
//  MavisCybillTek
//
//  Created by Tzu-Yen Huang on 2018/11/23.
//  Copyright © 2018年 Tzu-Yen Huang. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class PersonDAO{
    
    
    static func getPersonData(){
        let path = "https://www.dropbox.com/s/sxrxgzt4lx9ci9c/Person.json?dl=1"
        let url = URL(string: path)
        let session = URLSession.shared
        let task = session.dataTask(with: url!) {(data,res,error) in
            if let e = error{
                print("Error:\(e)")
                return
            }
            if let result = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]{
                let item = result!["Person"]! as! [[String:Any]]
                    DispatchQueue.main.async {
                        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                        for person in item{
                            let p = NSEntityDescription.insertNewObject(forEntityName: "PersonData", into: moc) as! PersonData
                            p.firstName = person["FirstName"] as? String
                            p.lastName = person["LastName"] as? String
                            p.birthday = person["Birthday"] as? String
                            p.email = person["Email"] as? String
                            p.mobile = person["MobileNumber"] as? String
                            p.address = person["Address"] as? String
                            p.contactPerson = person["ContactPerson"] as? String
                            p.contactPersonNumber = person["ContactPersonPhone"] as? String
                            do {
                                try moc.save()
                            } catch {
                                fatalError("\(error)")
                            }
                        }
                    }
                }
            }
        task.resume()
        task.cancel()
    }
    
    static func deleteCoreData(){
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "PersonData")
        request.predicate = nil
        request.predicate = NSPredicate(format: "firstName = 'Lynn'")
        
        do {
            let results = try moc.fetch(request) as! [PersonData]
            for result in results {
                moc.delete(result)
            }
            try moc.save()
            
        } catch {
            fatalError("\(error)")
        }
    }
    
    static func getPersonDataFromCoreData(list:inout [Person]){
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let myEntityName = "PersonData"
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: myEntityName)
        // sorting
        request.sortDescriptors = [NSSortDescriptor(key: "lastName", ascending: true)]
        do {
            let results =
                try moc.fetch(request) as! [PersonData]
            for result in results {
                var person = Person()
                if let firstName = result.firstName{
                    person.firstName = firstName
                }
                if let lastName = result.lastName{
                    person.lastName = lastName
                }
                if let birthday = result.birthday{
                    person.birthday = birthday
                }
                if let email = result.email{
                    person.email = email
                }
                if let address = result.address{
                    person.address = address
                }
                if let mobile = result.mobile{
                    person.mobile = mobile
                }
                if let contactPerson = result.contactPerson{
                    person.contactPerson = contactPerson
                }
                if let contactPersonNumber = result.contactPersonNumber{
                    person.contactPersonNumber = contactPersonNumber
                }
                list.append(person)
                print(person)
            }
        } catch {
            fatalError("\(error)")
        }
    }
}
