//
//  main.swift
//  SwiftPayroll
//
//  Created by user on 2018-07-25.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation

print("Hello, World! Test")

var employees: [Employee] = [Employee]()

//To get current Directory
let cwd = FileManager.default.currentDirectoryPath
print("script run from:\n" + cwd)



if let filePath = Bundle.main.url(forResource: "Employee", withExtension: "json"){
//    let url = URL(string: filePath)!
    
    
    
    /// ---- get dictionary ---- ///

    do {
        let data = try Data(contentsOf: filePath)
        let jsonDict: [Dictionary<String, Any>] = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [Dictionary<String, Any>]
        print(jsonDict)
        
        var eId: Int?
        var eName: String?
        var eAge: Int?
        
        for employee in jsonDict{
            var empObj: Employee?
            
            if let id = employee["id"]{
                print("id: \(id)")
                eId = id as? Int
            }
            
            if let name = employee["name"]{
                eName = name as? String
            }
            
            if let age = employee["age"]{
                eAge = age as? Int
            }
            
            
            var vehicle: Vehicle?
            if let v = employee["vehicle"] as? [String: Any]{
                if let type = v["type"] as? String{
                    if(type == "Car"){
                        vehicle = Car(make: (v["make"] as? String)!, plate: (v["plate"] as? String)!, bootSpace: (v["bootSpace"] as? Double)!)
                    }else{
                        vehicle = Motorcycle(make: (v["make"] as? String)!, plate: (v["plate"]! as? String)!, isLongDistance: true)
                    }
                }
            }else{
                vehicle = Vehicle()
            }
            
            if let type = employee["type"] as? String{
                if(type == EmployeeType.intern.rawValue){
                    let school = employee["schoolName"] as? String
                    empObj = Intern(employeeId: eId!, employeeName: eName!, age: eAge!, schoolName: school!, vehicle: vehicle!)
                }else if(type == EmployeeType.fullTime.rawValue){
                    let salary = employee["salary"] as? Double
                    let bonus = employee["bonus"]
                    empObj = FullTime(employeeId: eId!, employeeName: eName!, age: eAge!, salary: salary!, bonus: bonus! as! Double, vehicle: vehicle!)
                }else if(type == EmployeeType.fixedPartTime.rawValue){
                    let hoursWorked = employee["hoursWorked"] as? Double
                    let rate = employee["rate"] as? Double
                    let fixedAmount = employee["fixedAmount"] as? Double
                    empObj = FixedBased(employeeId: eId!, employeeName: eName!, age: eAge!, rate: rate!, hoursWorked: hoursWorked!, fixedAmount: fixedAmount!, vehicle: vehicle!)
                }else{
                    let hoursWorked = employee["hoursWorked"] as? Double
                    let rate = employee["rate"] as? Double
                    let commissionPercent = employee["commissionPercent"] as? Double
                    empObj = CommissionBased(employeeId: eId!, employeeName: eName!, age: eAge!, rate: rate!, hoursWorked: hoursWorked!, commissionPercentage: commissionPercent!, vehicle: vehicle!)
                }
            }
            
           
            employees.append(empObj!)
        }
        let csvObj = CSVFile()
        csvObj.createCSVFile(from: employees)
//        csvObj.createCSV(from: jsonDict)
    }
    catch {
        //Handle error
        print("ERROR")
    }
}else{
    print("FAIL-2")

//    do {
//        let data = try Data(contentsOf: filePath)
//        let jsonDict: [Dictionary<String, Any>] = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [Dictionary<String, Any>]
//        print(jsonDict)
//        for employee in jsonDict{
//            if let id = employee["id"]{
//                print("id: \(id)")
//            }
//        }
//        let csvObj = CSVFile()
////        csvObj.createCSV(from: jsonDict)
//    }
//    catch {
//        //Handle error
//        print("ERROR")
//    }
//}else{
//    print("FAIL-2")

}













///---- conversion using coder ---------///
/*
 let jsonData = try! Data(contentsOf: filePath)
 
 let jsonDecoder = JSONDecoder()
 let employees = try? jsonDecoder.decode(Array<EmployeeJson>.self,
 from: jsonData)
 
 if let employeeArray = employees{
 for employee in employeeArray{
 print(employee.id)
 if let make = employee.vehicle?.make{
 print(make)
 }
 }
 
 do{
 let csvObj = CSVFile()
 csvObj.createCSV(from: employeeArray)
 }
 }*/

