//
//  CSVEmployee.swift
//  SwiftPayroll
//
//  Created by Sonia Rani on 2018-07-27.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation

class CSVEmployee {
    
    func createCSV(from employees: [String: Employee]) {
        
        var csvTitleString = "\("Employee ID"),\("Employee Name"), \("Age"), \("Employee Type"), \("Vehicle"), \("Make"), \("Plate"), \("isLongDistance"), \("School Name"), \("Hours Worked"), \("Rate"), \("Fixed Amount"), \("Total Salary")\n"
        var csvDataString = ""
        
        for key in employees.values {
            
            if key is Intern{
                print("key: \(key._vehicle?._make)")
                //csvDataString = appendData(string: csvDataString, employee: )
            }
            
//            if(employee.type == EmployeeType.intern.rawValue){
//
//
//                csvDataString = appendData(string: csvDataString, employee: employee)
//            }else if(employee.type == EmployeeType.fullTime.rawValue){
//
//                csvDataString = appendData(string: csvDataString, employee: employee)
//            }else if(employee.type == EmployeeType.fixedPartTime.rawValue){
//                csvDataString = appendData(string: csvDataString, employee: employee)
//            }else{
//                csvDataString = appendData(string: csvDataString, employee: employee)
//            }
            
        }
        
        csvTitleString = csvTitleString.appending(csvDataString)
        
        let fileManager = FileManager.default
        do {
            let path = try fileManager.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
            let fileURL = path.appendingPathComponent("CSVFile.csv")
            try csvTitleString.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            print("error creating file")
        }
    }
    
    
    
    
    func appendData(string: String, employee: Employee) -> String{
        var bootSpace: Double?
        var isLongDistance: Bool?
        if(employee._vehicle is Car){
            let carObj = employee._vehicle as! Car
            bootSpace = carObj._bootSpace
        }else if(employee._vehicle is Motorcycle){
            let motorcycleObj = employee._vehicle as! Motorcycle
            isLongDistance = motorcycleObj._isLongDistance
        }
       
        let appendedString = string.appending("\(employee._employeeId), \(employee._employeeName), \(employee._age), \(employee.type), \(employee.vehicle?.type ?? "None"), \(employee.vehicle?.make ?? "-"), \(employee.vehicle?.plate ?? "-"), \(isLongDistance), \(employee.schoolName ?? "-"), \(employee.hoursWorked ?? 0), \(employee.rate ?? 0.0), \(employee.fixedAmount ?? 0), \(1000) \n")
        return appendedString
}
}
