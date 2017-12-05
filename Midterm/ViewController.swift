//
//  ViewController.swift
//  Midterm
//
//  Created by Eric Lachapelle on 2017-11-27.
//  Copyright © 2017 Eric Lachapelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EventPassingDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    // create new instance of ScheduleClass
    var newSchedule: ScheduleClass = ScheduleClass()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // add some dummy events
        newSchedule.addNewEvent(title: "Pool Party", description: "Yeee let's go swimming and get wasted.", dateString: "2017-01-01 12:34")
        newSchedule.addNewEvent(title: "Music Festival", description: "REM, Swans, Madlib, and Gentle Giant are playing.", dateString: "2017-04-07 01:23")
        newSchedule.addNewEvent(title: "Wedding", description: "Jacob and Wendy are getting married.", dateString: "2017-07-17 07:47")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return newSchedule.eventCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        // cell text is title for each event
        cell.textLabel?.text = newSchedule.eventArray[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showEventDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? EventViewController{
            destination.event = newSchedule.eventArray[(tableView.indexPathForSelectedRow?.row)!]
        }
        else if segue.identifier == "addNewEvent" {
            let nextViewController = segue.destination as? NewEventViewController
            nextViewController?.delegate = self
        }
    }
    
    func passEventBack(newEvent: EventClass){
        
        newSchedule.addNewEvent(event: newEvent)
        self.tableView.reloadData()
    }
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
}

