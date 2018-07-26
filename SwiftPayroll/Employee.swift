//
//  Employee.swift
//  SwiftPayroll
//
//  Created by user on 2018-07-25.
//  Copyright © 2018 Veerpal. All rights reserved.
//

import Foundation

class Employee
{
    var employeeId: Int?
    var employeeName: String?
    var age: Int?
    var vehicle: Vehicle?
    
    init(employeeId: Int, employeeName: String, age: Int)
    {
        self.employeeId = employeeId
        self.employeeName = employeeName
        self.age = age
    }
    // func calculateBirthYear(age) -> Int {    }
    func printMyData() {
        print("""
            Employee Details
            Employee Id: \(employeeId!)
            Name: \(employeeName!)
            Age: \(age!)
            """)
    }
}
