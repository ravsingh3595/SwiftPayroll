//
//  EmployeeJson.swift
//  SwiftPayroll
//
//  Created by Sonia Rani on 2018-07-26.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation

struct EmployeeJson: Codable {
    let id: Int
    let name: String
    let age: Int
    let vehicle: Vehicle?
    let type: String
    
    // intern
    let schoolName: String?
    
    // part time
    let rate: Float?
    let hoursWorked: Int?
    
    // PartTime/Fixed
    let fixedAmount: Int?
    
    // fulltime
    let salary: Float?
    let bonus: Float?
    
    // parttime/commissioned
    let commissionPercent: Int?
    
    let totalSalary: Double?
    
    struct Vehicle: Codable{
        let id: Int
        let make: String
        let plate: String
        let type: String
        let isLongDistance: Bool?
    }
    
    
}

