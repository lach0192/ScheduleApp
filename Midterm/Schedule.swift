//
//  Schedule.swift
//  Midterm
//
//  Created by Eric Lachapelle on 2017-11-27.
//  Copyright © 2017 Eric Lachapelle. All rights reserved.
//

import Foundation

class ScheduleClass{
    
    var eventArray: Array<EventClass> = []
    
    // get-only
    var eventCount: Int {
        
        // if empty return 0
        guard eventArray.isEmpty == false
            else{
                return 0
        }
        // if not empty return count
        return eventArray.count
    }
    
    func addNewEvent(title: String, description: String, dateString: String){
        
        let newEvent:EventClass = EventClass(title: title, description: description, dateString: dateString)
        
        eventArray.append(newEvent)
    }
    
    func addNewEvent(event: EventClass){
        
        eventArray.append(event)
    }
    
    func outputAllEvents() -> String{
        
        // if empty return error
        guard eventArray.isEmpty == false
            else{
                return "Error: eventArray is empty."
        }
        
        // if not empty return string containing all info from each event
        var allEvents: String = ""
        
        for i in 0 ..< eventArray.count{
            
            allEvents += eventArray[i].getInfo()
        }
        
        return allEvents
    }
}
