//
//  Person.swift
//  MavisCybillTek
//
//  Created by Tzu-Yen Huang on 2018/11/23.
//  Copyright © 2018年 Tzu-Yen Huang. All rights reserved.
//

import Foundation

struct Person{
    var firstName = ""
    var lastName = ""
    var birthday = ""
    var age : Int {
        get{
            let today = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let date = formatter.string(from: today)
            print(date)
            let year = Int (date.prefix(4))
            let month = Int((date as NSString).substring(with:NSMakeRange(5,2)))
            let day = Int(date.suffix(2))
            
            let birthYear = Int (birthday.prefix(4))
            let birthMonth = Int((birthday as NSString).substring(with:NSMakeRange(5,2)))
            let birthDay = Int(birthday.suffix(2))
            var tempAge = year! - birthYear!
            if (month! - birthMonth!) < 0 {
                tempAge = tempAge - 1
            }else if (month! - birthMonth!) == 0 && (day! - birthDay!) < 0 {
                tempAge = tempAge - 1
            }
            return tempAge
        }
    }
    var email = ""
    var mobile = ""
    var address = ""
    var contactPerson = ""
    var contactPersonNumber = ""
    
}
