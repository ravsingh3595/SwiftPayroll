//
//  Employee.swift
//  Group2_FinalProject_Payroll
//
//  Created by user on 2018-07-23.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation

class Employee: IPrintable
{
    private var employeeId: Int?
    var _employeeId: Int?
    {
        get{
            return employeeId
        }
    }
    private var employeeName: String?
    var _employeeName: String?
    {
        get{
            return employeeName
        }
    }
    
    private var age: Int?
    var _age: Int?
    {
        get{
            return age
        }
    }
    
    private var vehicle: Vehicle?
    var _vehicle: Vehicle?
    {
        get{
            return vehicle
        }
    }
    private var employeeType: String?
    var _employeeType: String?
    {
        get{
            return employeeType
        }
        set(newValue)
        {
            employeeType = newValue
        }
    }
    
    init() {
        
    }
    
    init(employeeId: Int, employeeName: String, age: Int, vehicle: Vehicle)
    {
        self.employeeId = employeeId
        self.employeeName = employeeName
        self.age = age
        self.vehicle = vehicle
    }
    
    func calEarning() -> Double {
        return 1000
    }
    
    func printMyData() {
        
        print("""
            ---------------------------------------
            Employee Details
            Employee Id: \(employeeId!)
            Name: \(employeeName!)
            Age: \(age!)
            """)
        if(vehicle is Car){
            let car: Car = vehicle as! Car
            car.printMyData()
            
        }else if(vehicle is Motorcycle){
            let motorcycle: Motorcycle = vehicle as! Motorcycle
            motorcycle.printMyData()
            
        }else{
            print("Employee Has no Vehicle")
        }
    }
}
