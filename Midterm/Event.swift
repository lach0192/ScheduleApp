//
//  Event.swift
//  Midterm
//
//  Created by Eric Lachapelle on 2017-11-27.
//  Copyright © 2017 Eric Lachapelle. All rights reserved.
//

import Foundation

class EventClass{
    
    var title: String?
    var description: String?
    var date: Date?
    
    init(title: String, description: String){
        self.title = title
        self.description = description
    }
    
    convenience init(title: String, description: String, dateString: String){
        self.init(title: title, description: description)
        setDate(formatedDateString: dateString)
    }
    
    convenience init(title: String, description: String, date: Date){
        self.init(title: title, description: description)
        self.date = date
    }
    
    // takes date as string, turns to date
    func setDate(formatedDateString: String){
        let formatting = DateFormatter()
        formatting.dateFormat = "yyyy/MM/dd HH:mm"
        self.date = formatting.date(from: formatedDateString)
    }
    
    // returns formatted string of event info
    func getInfo() -> String{
        return "\nEvent Title:\t\t\t\(title!)\nEvent Date:\t\t\t\(date!.description)\nEvent Description:\t\(description!)\n"
    }
}
