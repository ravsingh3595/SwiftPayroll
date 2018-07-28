//
//  PartTime.swift
//  SwiftPayroll
//
//  Created by Veerpal on 2018-07-25.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation

class PartTime: Employee
{
    var rate: Double?
    var _rate: Double?
    {
        get{
            return rate
        }
    }
    
    var hoursWorked: Double?
    var _hoursWorked: Double?
    {
        get{
            return hoursWorked
        }
    }
    
    init(employeeId: Int, employeeName: String, age: Int, rate: Double, hoursWorked: Double, vehicle: Vehicle)
    {
        super.init(employeeId: employeeId, employeeName: employeeName, age: age, vehicle: vehicle)
        self.rate = rate
        self.hoursWorked = hoursWorked
    }
    
        override func calEarning() -> Double {
            return 1000
        }
    
    override func printMyData()
    {
        super.printMyData()
        print("Rate: \(rate!) \n Hours Worked: \(hoursWorked!)")
    }
}
