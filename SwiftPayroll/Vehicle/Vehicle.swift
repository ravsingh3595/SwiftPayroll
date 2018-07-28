//
//  Vehicle.swift
//  SwiftPayroll
//
//  Created by Veerpal on 2018-07-25.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation

class Vehicle
{
    private var make: String?
    var _make: String?
    {
        get{
            return make
        }
    }
    
    private var plate: String?
    var _plate: String?
    {
        get{
            return plate
        }
    }
    
    init() {
        
    }
    
    init(make: String, plate: String)
    {
        self.make = make
        self.plate = plate
    }
    
    func printMyData() {
        print("Make: \(make!) \n Plate: \(plate!)")
    }
}
