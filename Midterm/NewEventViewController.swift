//
//  NewEventViewController.swift
//  Midterm
//
//  Created by Eric Lachapelle on 2017-11-28.
//  Copyright © 2017 Eric Lachapelle. All rights reserved.
//

import UIKit

class NewEventViewController: UIViewController {

    @IBOutlet weak var newEventTitleTxt: UITextField!
    @IBOutlet weak var newEventDescriptionTxt: UITextView!
    @IBOutlet weak var newEventDate: UIDatePicker!
    
    var event:EventClass?
    
    var delegate: EventPassingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        newEventTitleTxt.placeholder = "Title"
    }
    
    @IBAction func createNewEventBtnClick(_ sender: Any) {

        // only allow event creation if title is entered
        if(newEventTitleTxt.text != ""){
        
            event = EventClass(title: newEventTitleTxt.text!, description: newEventDescriptionTxt.text!, date: newEventDate!.date)

            delegate?.passEventBack(newEvent: event!)
            navigationController?.popViewController(animated: true)
        }
    }
}
