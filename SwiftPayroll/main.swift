//
//  main.swift
//  SwiftPayroll
//
//  Created by user on 2018-07-25.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation

print("Hello, World! Test")

var employee: [Employee] = [Employee]()

//To get current Directory
let cwd = FileManager.default.currentDirectoryPath
print("script run from:\n" + cwd)



if let filePath = Bundle.main.url(forResource: "Employee", withExtension: "json"){
//    let url = URL(string: filePath)!
    
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
    }
    
    /// ---- get dictionary ---- ///
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

