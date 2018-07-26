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
    
    init(employeeId: Int, employeeName: String, age: Int, rate: Double, hoursWorked: Double)
    {
        super.init(employeeId: employeeId, employeeName: employeeName, age: age)
        self.rate = rate
        self.hoursWorked = hoursWorked
    }
    
    //    func calEarning() -> Double {
    //        return salary! + bonus!
    //    }
    
    override func printMyData()
    {
        print("Rate: \(rate!) \n Hours Worked: \(hoursWorked!)")
    }
}
