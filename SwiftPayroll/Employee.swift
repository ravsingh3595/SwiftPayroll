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
    private var employeeId: Int?
    private var employeeName: String?
    private var age: Int?
    private var vehicle: Vehicle?
    
    init() {
        
    }
    
    init(employeeId: Int, employeeName: String, age: Int, vehicle: Vehicle)
    {
        self.employeeId = employeeId
        self.employeeName = employeeName
        self.age = age
        self.vehicle = vehicle
    }
    // func calculateBirthYear(age) -> Int {    }
    func printMyData() {
        
        print("""
            ---------------------------------------
            Employee Details
            Employee Id: \(employeeId!)
            Name: \(employeeName!)
            Age: \(age!)
            Vehicle Info:
            make: \(vehicle?.make ?? "")
            plate: \(vehicle?.plate)
            """)
    }
}
