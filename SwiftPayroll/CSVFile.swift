//
//  CSVFile.swift
//  SwiftPayroll
//
//  Created by Sonia Rani on 2018-07-26.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation


class CSVFile {
    
    func createCSV(from employees: [EmployeeJson]) {
        
        var csvTitleString = "\("Employee ID"),\("Employee Name"), \("Age"), \("Employee Type"), \("Vehicle"), \("Make"), \("Plate"), \("isLongDistance"), \("School Name"), \("Hours Worked"), \("Rate"), \("Fixed Amount"), \("Total Salary")\n"
        var csvDataString = ""
        
        for employee in employees {
           
            
            if(employee.type == EmployeeType.intern.rawValue){
            
            
                csvDataString = appendData(string: csvDataString, employee: employee)
            }else if(employee.type == EmployeeType.fullTime.rawValue){
                
                csvDataString = appendData(string: csvDataString, employee: employee)
            }else if(employee.type == EmployeeType.fixedPartTime.rawValue){
                csvDataString = appendData(string: csvDataString, employee: employee)
            }else{
                csvDataString = appendData(string: csvDataString, employee: employee)
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
    
  
    
    
    func appendData(string: String, employee: EmployeeJson) -> String{
        var longDistance = ""
        if let isLongDistance = employee.vehicle?.isLongDistance{
            if(isLongDistance){
                longDistance = "Yes"
            }else{
                longDistance = "No"
            }
        }else{
            longDistance = "-"
        }
        let appendedString = string.appending("\(employee.id), \(employee.name), \(employee.age), \(employee.type), \(employee.vehicle?.type ?? "None"), \(employee.vehicle?.make ?? "-"), \(employee.vehicle?.plate ?? "-"), \(longDistance), \(employee.schoolName ?? "-"), \(employee.hoursWorked ?? 0), \(employee.rate ?? 0.0), \(employee.fixedAmount ?? 0), \(1000) \n")
        return appendedString
    }
    
//    func calEarning() -> Double{
//        
//    }
    
}
