//
//  CommissionBased.swift
//  Group2_FinalProject_Payroll
//
//  Created by user on 2018-07-23.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation

class CommissionBased: PartTime
{
    private var commissionPercentage: Double?
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
        return (_rate! * _hoursWorked!) + commissionPercentage!
    }
    
    override func printMyData()
    {
        super.printMyData()
        print("Employee is a Commission Based/ PartTime")
        print("\tCommission Percentage: \(commissionPercentage!)")
        print("Earnings: \(calEarning())")
    }
}
