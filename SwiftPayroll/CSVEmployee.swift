//
//  CSVEmployee.swift
//  Group2_FinalProject_Payroll
//
//  Created by user on 2018-07-28.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation

enum EmployeeType: String{
    case intern = "Intern"
    case fullTime = "FullTime"
    case commissionPartTime = "PartTime/Commissioned"
    case fixedPartTime = "PartTime/Fixed"
}

class CSVEmployee {
    
    func createCSV(from employees: [String: Employee], TotalPayroll:  Double)
    {
        
        var csvTitleString = "\("Employee ID"),\("Employee Name"), \("Age"), \("Employee Type"), \("Vehicle"), \("Make"), \("Plate"), \("isLongDistance"), \("bootSpace"), \("School Name"), \("Hours Worked"), \("Rate"), \("Fixed Amount"), \("Commission"), \("Salary"), \("Bonus"), \("Earning")\n"
        
        var csvDataString = ""
        
        csvDataString = "Total Payroll: \(TotalPayroll) \n"
        
        for value in employees.values
        {
            if value is Intern{
                csvDataString = appendData(string: csvDataString, employee: value )
            }
            else if value is FullTime{
                csvDataString = appendData(string: csvDataString, employee: value)
            }
            else if value is CommissionBased{
                csvDataString = appendData(string: csvDataString, employee: value)
            }
            else if value is FixedBased{
                csvDataString = appendData(string: csvDataString, employee: value)
            }
        }
        
        csvTitleString = csvTitleString.appending(csvDataString)
        
        let fileManager = FileManager.default
        do {
            let path = try fileManager.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
            let fileURL = path.appendingPathComponent("EmployeeDetailsCSV.csv")
            try csvTitleString.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            print("error creating file")
        }
    }
    
    // getting the data from the Model Classes
    func appendData(string: String, employee: Employee) -> String
    {
        var bootSpace: Double? = 0.0
        var isLongDistance: Bool? = false
        var appendedString: String?
        
        if(employee._vehicle is Car)
        {
            let carObj = employee._vehicle as! Car
            employee._vehicle?._vehicleType = "Car"
            bootSpace = carObj._bootSpace
        }
        else if(employee._vehicle is Motorcycle)
        {
            let motorcycleObj = employee._vehicle as! Motorcycle
            employee._vehicle?._vehicleType = "Motorcycle"
            isLongDistance = motorcycleObj._isLongDistance
        }
        
        // checking for the type of Empployee
        if(employee._employeeType == EmployeeType.intern.rawValue)
        {
            let intern = employee as! Intern
            appendedString = string.appending("\(intern._employeeId!), \(intern._employeeName!), \(intern._age!), \(intern._employeeType!), \(intern._vehicle?._vehicleType ?? "None"), \(intern._vehicle?._make ?? "-"), \(intern._vehicle?._plate ?? "-"), \(isLongDistance!), \(bootSpace!), \(intern._schoolName ?? "-"), \(0.0), \(0.0), \(0.0), \(0.0), \(0.0), \(0.0), \(intern.calEarning()) \n")
        }
        else if(employee._employeeType == EmployeeType.fullTime.rawValue)
        {
            let fullTime = employee as! FullTime
            appendedString = string.appending("\(fullTime._employeeId!), \(fullTime._employeeName!), \(fullTime._age!), \(fullTime._employeeType!), \(fullTime._vehicle?._vehicleType ?? "None"), \(fullTime._vehicle?._make ?? "-"), \(fullTime._vehicle?._plate ?? "-"), \(isLongDistance!), \(bootSpace!), \("-"), \(0.0), \(0.0), \(0.0), \(0.0), \(fullTime._salary ?? 0.0), \(fullTime._bonus ?? 0.0), \(fullTime.calEarning()) \n")
        }
        else if(employee._employeeType == EmployeeType.commissionPartTime.rawValue)
        {
            let commissionBased = employee as! CommissionBased
            appendedString = string.appending("\(commissionBased._employeeId!), \(commissionBased._employeeName!), \(commissionBased._age!), \(commissionBased._employeeType!), \(commissionBased._vehicle?._vehicleType ?? "None"), \(commissionBased._vehicle?._make ?? "-"), \(commissionBased._vehicle?._plate ?? "-"), \(isLongDistance!), \(bootSpace!), \("-"), \(commissionBased._hoursWorked ?? 0.0), \(commissionBased._rate ?? 0.0), \(0.0), \(commissionBased._commissionPercentage ?? 0.0), \(0.0), \(0.0), \(commissionBased.calEarning()) \n")
        }
        else if(employee._employeeType == EmployeeType.fixedPartTime.rawValue)
        {
            let fixedBased = employee as! FixedBased
            appendedString = string.appending("\(fixedBased._employeeId!), \(fixedBased._employeeName!), \(fixedBased._age!), \(fixedBased._employeeType!), \(fixedBased._vehicle?._vehicleType ?? "None"), \(fixedBased._vehicle?._make ?? "-"), \(fixedBased._vehicle?._plate ?? "-"), \(isLongDistance!), \(bootSpace!), \("-"), \(fixedBased._hoursWorked ?? 0.0), \(fixedBased._rate ?? 0.0), \(fixedBased._fixedAmount ?? 0.0), \(0.0), \(0.0), \(0.0), \(fixedBased.calEarning()) \n")
        }
        return appendedString!
    }
}
