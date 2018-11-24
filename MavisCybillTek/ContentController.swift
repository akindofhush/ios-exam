//
//  ContentController.swift
//  MavisCybillTek
//
//  Created by Tzu-Yen Huang on 2018/11/24.
//  Copyright © 2018年 Tzu-Yen Huang. All rights reserved.
//

import UIKit

class ContentController: UIViewController {
    @IBOutlet var name: UILabel!
    @IBOutlet var birthday: UILabel!
    @IBOutlet var age: UILabel!
    @IBOutlet var mobile: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var contactPerson: UILabel!
    @IBOutlet var contactPersonMobile: UILabel!
    var person:Person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = person.lastName + " " + person.firstName
        birthday.text = person.birthday
        age.text = String(person.age)
        mobile.text = person.mobile
        address.text = person.address
        contactPerson.text = person.contactPerson
        contactPersonMobile.text = person.contactPersonNumber
    }
}
