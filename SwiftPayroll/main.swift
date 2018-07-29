//
//  main.swift
//  Group2_FinalProject_Payroll
//
//  Created by user on 2018-07-23.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation

var employeeArray: [Employee] = [Employee]()

//To get current Directory
let cwd = FileManager.default.currentDirectoryPath
print("script run from:\n" + cwd)

if let filePath = Bundle.main.url(forResource: "Employee", withExtension: "json")
{
    do {
        // reading the data from the JSON file
        let data = try Data(contentsOf: filePath)
        let jsonDict: [Dictionary<String, Any>] = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [Dictionary<String, Any>]
        //print(jsonDict)
        
        var eId: Int?
        var eName: String?
        var eAge: Int?
        
        //fetching the data fro the Dictionary made from the JSON extraction
        for employee in jsonDict{
            var empObj: Employee?
            
            if let id = employee["id"]{
                //print("id: \(id)")
                eId = id as? Int
            }
            
            if let name = employee["name"]{
                eName = name as? String
            }
            
            if let age = employee["age"]{
                eAge = age as? Int
            }
            
            // Checking the vehicle type
            var vehicle: Vehicle?
            if let v = employee["vehicle"] as? [String: Any]
            {
                if let type = v["type"] as? String
                {
                    if(type == "Car")
                    {
                        vehicle = Car(make: (v["make"] as? String)!, plate: (v["plate"] as? String)!, bootSpace: (v["bootSpace"] as? Double)!)
                    }
                    else
                    {
                        vehicle = Motorcycle(make: (v["make"] as? String)!, plate: (v["plate"]! as? String)!, isLongDistance: true)
                    }
                }
            }
            else
            {
                vehicle = Vehicle()
            }
            
            //Passing the value of parameter in employee's child classes using their constructors
            if let type = employee["type"] as? String
            {
                if(type == EmployeeType.intern.rawValue)
                {
                    let school = employee["schoolName"] as? String
                    
                    empObj = Intern(employeeId: eId!, employeeName: eName!, age: eAge!, schoolName: school!, vehicle: vehicle!)
                }
                else if(type == EmployeeType.fullTime.rawValue)
                {
                    let salary = employee["salary"] as? Double
                    let bonus = employee["bonus"] as? Double
                    
                    empObj = FullTime(employeeId: eId!, employeeName: eName!, age: eAge!, salary: salary!, bonus: bonus!, vehicle: vehicle!)
                }
                else if(type == EmployeeType.fixedPartTime.rawValue)
                {
                    let hoursWorked = employee["hoursWorked"] as? Double
                    let rate = employee["rate"] as? Double
                    let fixedAmount = employee["fixedAmount"] as? Double
                    
                    empObj = FixedBased(employeeId: eId!, employeeName: eName!, age: eAge!, rate: rate!, hoursWorked: hoursWorked!, fixedAmount: fixedAmount!, vehicle: vehicle!)
                }
                else
                {
                    let hoursWorked = employee["hoursWorked"] as? Double
                    let rate = employee["rate"] as? Double
                    let commissionPercent = employee["commissionPercent"] as? Double
                    
                    empObj = CommissionBased(employeeId: eId!, employeeName: eName!, age: eAge!, rate: rate!, hoursWorked: hoursWorked!, commissionPercentage: commissionPercent!, vehicle: vehicle!)
                }
            }
            employeeArray.append(empObj!)
        }
        
        //Printing of all Employee data
        var totalEarning: Double? = 0.0
        var employeeDic = [String: Employee]()
        
        for (index, employee) in employeeArray.enumerated(){
            employeeDic["e\(index)"] = employee
            if employee is Intern
            {
                employee.printMyData()
                employee._employeeType = EmployeeType.intern.rawValue
                totalEarning = totalEarning! + employee.calEarning()
                
            }
            else if(employee is FullTime)
            {
                employee.printMyData()
                employee._employeeType = EmployeeType.fullTime.rawValue
                totalEarning = totalEarning! + employee.calEarning()
                
            }
            else if(employee is CommissionBased)
            {
                employee.printMyData()
                employee._employeeType = EmployeeType.commissionPartTime.rawValue
                totalEarning = totalEarning! + employee.calEarning()
                
            }
            else if(employee is FixedBased)
            {
                employee.printMyData()
                employee._employeeType = EmployeeType.fixedPartTime.rawValue
                totalEarning = totalEarning! + employee.calEarning()
            }
        }
        print("*************************************")
        print("Total Payroll: \(totalEarning!)")
        
        let csvEmployee = CSVEmployee()
        csvEmployee.createCSV(from: employeeDic, TotalPayroll: totalEarning!)
    }
        
    catch
    {
        //Handle error
        print(error.localizedDescription)
    }
}

