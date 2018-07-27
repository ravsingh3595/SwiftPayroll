//
//  CSVFile.swift
//  SwiftPayroll
//
//  Created by Sonia Rani on 2018-07-26.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation

enum EmployeeType: String{
    case intern = "Intern"
    case fullTime = "FullTime"
    case commissionPartTime = "PartTime/Commissioned"
    case fixedPartTime = "PartTime/Fixed"
}

class CSVFile {
    
    func createCSV(from employees: [EmployeeJson]) {
        
        var csvTitleString = "\("Employee ID"),\("Employee Name"), \("Age"), \("Employee Type"), \("Vehicle"), \("Make"), \("Plate"), \("isLongDistance"), \("School Name"), \("Hours Worked"), \("Rate"), \("Fixed Amount"), \("Total Salary")\n"
        var csvDataString = ""
        var longDistance = ""
        for employee in employees {
            if let isLongDistance = employee.vehicle?.isLongDistance{
                if(isLongDistance){
                    longDistance = "Yes"
                }else{
                    longDistance = "No"
                }
            }else{
                longDistance = "-"
            }
            
            if(employee.type == "Intern"){
                csvDataString = csvDataString.appending("\(employee.id), \(employee.name), \(employee.age), \(employee.type), \(employee.vehicle?.type ?? "None"), \(employee.vehicle?.make ?? "-"), \(employee.vehicle?.plate ?? "-"), \(longDistance), \(employee.schoolName ?? "-"), \(employee.hoursWorked ?? 0), \(employee.rate ?? 0.0), \(employee.fixedAmount ?? 0), \(1000) \n")
            }else if(employee.type == "FullTime"){
                csvDataString = csvDataString.appending("\(employee.id), \(employee.name), \(employee.age), \(employee.type), \(employee.vehicle?.type ?? "None"), \(employee.vehicle?.make ?? "-"), \(employee.vehicle?.plate ?? "-"), \(longDistance), \(employee.schoolName ?? "-"), \(employee.hoursWorked ?? 0), \(employee.rate ?? 0.0), \(employee.fixedAmount ?? 0), \(2000) \n")
            }else if(employee.type == "PartTime/Fixed"){
                csvDataString = csvDataString.appending("\(employee.id), \(employee.name), \(employee.age), \(employee.type), \(employee.vehicle?.type ?? "None"), \(employee.vehicle?.make ?? "-"), \(employee.vehicle?.plate ?? "-"), \(longDistance), \(employee.schoolName ?? "-"), \(employee.hoursWorked ?? 0), \(employee.rate ?? 0.0), \(employee.fixedAmount ?? 0), \(3000) \n")
            }else{
                csvDataString = csvDataString.appending("\(employee.id), \(employee.name), \(employee.age), \(employee.type), \(employee.vehicle?.type ?? "None"), \(employee.vehicle?.make ?? "-"), \(employee.vehicle?.plate ?? "-"), \(longDistance), \(employee.schoolName ?? "-"), \(employee.hoursWorked ?? 0), \(employee.rate ?? 0.0), \(employee.fixedAmount ?? 0), \(4000) \n")
            }
            
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
    
    func createCSVFile(from employees: [Employee]) {
        
        var csvTitleString = "\("Employee ID"),\("Employee Name"), \("Age"), \("Employee Type"), \("Vehicle"), \("Make"), \("Plate"), \("isLongDistance"), \("School Name"), \("Hours Worked"), \("Rate"), \("Fixed Amount"), \("Total Salary")\n"
        var csvDataString = ""
        var longDistance = ""
        for employee in employees{
            if employee is Intern{  // write getter & setters
                // Intern
            }else if(employee is FullTime){
                // FullTime
            }else if(employee is CommissionBased){
                // CommissionBased
            }else if(employee is FixedBased){
                // FixedBased
            }
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



}
