//
//  Vehicle.swift
//  Group2_FinalProject_Payroll
//
//  Created by user on 2018-07-23.
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
    private var vehicleType: String?
    var _vehicleType: String?
    {
        get{
            return vehicleType
        }
        set(newValue)
        {
            vehicleType = newValue
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
        print("\tMake: \(make!) \n\tPlate: \(plate!)")
    }
}
