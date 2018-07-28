//
//  CommissionBased.swift
//  SwiftPayroll
//
//  Created by Veerpal on 2018-07-25.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation

class CommissionBased: PartTime
{
    var commissionPercentage: Double?
    var _commissionPercentage: Double?
    {
        get{
            return commissionPercentage
        }
    }
    
    init(employeeId: Int, employeeName: String, age: Int, rate: Double, hoursWorked: Double, commissionPercentage: Double, vehicle: Vehicle)
    {
        super.init(employeeId: employeeId, employeeName: employeeName, age: age, rate: rate, hoursWorked: hoursWorked, vehicle: vehicle)
        self.commissionPercentage = commissionPercentage
    }
    
    override func calEarning() -> Double
    {
        return (rate! * hoursWorked!) + commissionPercentage!
    }
    
    override func printMyData()
    {
        super.printMyData()
        print("Commission Percentage: \(commissionPercentage!)")
        print("Earnings: \(calEarning())")
    }
}
