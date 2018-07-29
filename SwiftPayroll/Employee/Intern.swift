//
//  Intern.swift
//  Group2_FinalProject_Payroll
//
//  Created by user on 2018-07-23.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation

class Intern: Employee
{
    private var schoolName: String?
    var _schoolName: String?
    {
        get{
            return schoolName
        }
    }
    
    init(employeeId: Int, employeeName: String, age: Int, schoolName: String, vehicle: Vehicle)
    {
        super.init(employeeId: employeeId, employeeName: employeeName, age: age, vehicle: vehicle)
        self.schoolName = schoolName
    }
    
    override func calEarning() -> Double {
        return 1000
    }
    
    override func printMyData()
    {
        super.printMyData()
        print("Employee is a Intern")
        print("\tSchool Name: \(schoolName!)")
        print("Earnings: \(calEarning())")
    }
}
