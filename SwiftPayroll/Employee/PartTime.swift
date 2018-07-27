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
    var hoursWorked: Double?
    
    init(employeeId: Int, employeeName: String, age: Int, rate: Double, hoursWorked: Double, vehicle: Vehicle)
    {
        super.init(employeeId: employeeId, employeeName: employeeName, age: age, vehicle: vehicle)
        self.rate = rate
        self.hoursWorked = hoursWorked
    }
    
    //    func calEarning() -> Double {
    //        return salary! + bonus!
    //    }
    
    override func printMyData()
    {
        super.printMyData()
        print("Rate: \(rate!) \n Hours Worked: \(hoursWorked!)")
    }
}
