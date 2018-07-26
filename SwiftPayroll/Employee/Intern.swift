//
//  Intern.swift
//  SwiftPayroll
//
//  Created by Sonia Rani on 2018-07-25.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation

class Intern: Employee
{
    var schoolName: String?
    
    init(employeeId: Int, employeeName: String, age: Int, schoolName: String)
    {
        super.init(employeeId: employeeId, employeeName: employeeName, age: age)
        self.schoolName = schoolName
    }
    
    func calEarning() -> Double {
        return 1000
    }
    
    override func printMyData()
    {
        print("School Name: \(schoolName!)")
        print("Earnings: \(calEarning())")
    }
}
