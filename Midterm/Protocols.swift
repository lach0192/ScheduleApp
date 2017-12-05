//
//  Protocols.swift
//  Midterm
//
//  Created by Eric Lachapelle on 2017-11-28.
//  Copyright © 2017 Eric Lachapelle. All rights reserved.
//

import Foundation

protocol EventPassingDelegate{
    
    func passEventBack(newEvent: EventClass)
}
