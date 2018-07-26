//
//  FixedBased.swift
//  SwiftPayroll
//
//  Created by Veerpal on 2018-07-25.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation

class FixedBased: PartTime
{
    var fixedAmount: Double?
    
    init(employeeId: Int, employeeName: String, age: Int, rate: Double, hoursWorked: Double, fixedAmount: Double)
    {
        super.init(employeeId: employeeId, employeeName: employeeName, age: age, rate: rate, hoursWorked: hoursWorked)
        self.fixedAmount = fixedAmount
    }
    
    func calEarning() -> Double
    {
        return (rate! * hoursWorked!) + fixedAmount!
    }
    
    override func printMyData()
    {
        print("Fixed Amount: \(fixedAmount!)")
        print("Earnings: \(calEarning())")
    }
}
