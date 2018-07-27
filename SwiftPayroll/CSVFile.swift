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
    
    
//    var employeeArray:[EmployeeJson] = [EmployeeJson]()
    func createCSV(from employees: [EmployeeJson]) {
        
        var csvTitleString = "\("Employee ID"),\("Employee Name"), \("Age"), \("Employee Type"), \("Vehicle"), \("Make"), \("Plate"), \("isLongDistance"), \("School Name"), \("Hours Worked"), \("Rate"), \("Fixed Amount"), \("Total Salary")\n"
//        var csvTitleIntern = "\("School Name")\n"
        var csvDataString = ""
        
//        var csvString = "\("Employee ID"),\("Employee Name"), \("Age"), \("Employee Type"), \("Vehicle")\n\n"
        
//        for dict in recArray {
//            // check employee type
//            let empType = String(describing:dict["type"]!)
//
//            csvString = csvString.appending("\(String(describing: dict["id"]!)) ,\(String(describing: dict["name"]!)), \(String(describing: dict["age"]!)), \(String(describing: empType))\n")
//
//        }
        
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
            
           
            
            
           
//            if let vehicle = employee.vehicle{
//                csvDataString = csvDataString.appending("\(vehicle.make), \(vehicle.plate) \n")
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
    
    
    /*
    var employeeArray:[Dictionary<String, Any>] =  Array()
    func createCSV(from recArray:[Dictionary<String, Any>]) {
        
        var csvString = "\("Employee ID"),\("Employee Name"), \("Age"), \("Employee Type"), \("Vehicle")\n"
        
        for dict in recArray {
            // check employee type
            let empType = String(describing:dict["type"]!)
            
            csvString = csvString.appending("\(String(describing: dict["id"]!)) ,\(String(describing: dict["name"]!)), \(String(describing: dict["age"]!)), \(String(describing: empType))\n")
            
            // check vehicle type
//            if let vehicle = dict["vehicle"]!["type"]! as? String{
//                if vehicle == "Car"{
//                    csvString = csvString.appending("Car")
//                }else{
//                    csvString = csvString.appending("")
//                }
//            }else{
//                csvString = csvString.appending("None")
//            }
            
            
            
            
//            csvString = csvString.appending("\(empType)\n")
//            switch(empType){
//            case EmployeeType.intern.rawValue:
//
//
//            default:
//                break
//            }
            
        }
        
        
        let fileManager = FileManager.default
        do {
            let path = try fileManager.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
            let fileURL = path.appendingPathComponent("CSVFile.csv")
            try csvString.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            print("error creating file")
        }
    }
    
    func appendData() {
        for i in 1...10 {
            var dct = Dictionary<String, Any>()
            dct.updateValue(i as AnyObject, forKey: "EmpID")
            dct.updateValue("NameForEmplyee id = \(i)" as AnyObject, forKey: "EmpName")
            employeeArray.append(dct)
        }
        
        self.createCSV(from: employeeArray)
    }*/
    
}
