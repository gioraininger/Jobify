//
//  CellSegueProtocol.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 23/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import Foundation

//Pass any objects, params you need to use on the
//segue call to send to the next controller.


protocol CellSegueProtocol {
    func callSegueFromCell(myData dataobject: AnyObject)
}
