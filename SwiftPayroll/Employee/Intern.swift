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
    
    init(employeeId: Int, employeeName: String, age: Int, schoolName: String, vehicle: Vehicle)
    {
        super.init(employeeId: employeeId, employeeName: employeeName, age: age, vehicle: vehicle)
        self.schoolName = schoolName
    }
    
    func calEarning() -> Double {
        return 1000
    }
    
    override func printMyData()
    {
        super.printMyData()
        print("School Name: \(schoolName!)")
        print("Earnings: \(calEarning())")
    }
}
