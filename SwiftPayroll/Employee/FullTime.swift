//
//  FullTime.swift
//  SwiftPayroll
//
//  Created by Veerpal on 2018-07-25.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation

class FullTime: Employee
{
    var salary: Double?
    var _salary: Double?
    {
        get{
            return salary
        }
    }
    
    var bonus: Double?
    var _bonus: Double?
    {
        get{
            return bonus
        }
    }
    
    init(employeeId: Int, employeeName: String, age: Int, salary: Double, bonus: Double, vehicle: Vehicle)
    {
        super.init(employeeId: employeeId, employeeName: employeeName, age: age, vehicle: vehicle)
        self.salary = salary
        self.bonus = bonus
    }
    
    override func calEarning() -> Double {
        return salary! + bonus!
    }
    
    override func printMyData()
    {
        super.printMyData()
        print("Salary: \(salary!) \n Bonus: \(bonus!)")
        print("Earnings: \(calEarning())")
    }
}
