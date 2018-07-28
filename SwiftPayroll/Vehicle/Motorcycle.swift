//
//  Motorcycle.swift
//  SwiftPayroll
//
//  Created by Veerpal on 2018-07-25.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation

class Motorcycle: Vehicle
{
    private var isLongDistance: Bool?
    var _isLongDistance: Bool?
    {
        get{
            return isLongDistance
        }
    }
    
    init(make: String, plate: String, isLongDistance: Bool)
    {
        super.init(make: make, plate: plate)
        self.isLongDistance = isLongDistance
    }
    
    override func printMyData()
    {
        print("Employee has a Motorcycle")
        super.printMyData()
        print("Is Long Distance bike: \(isLongDistance!)")
    }
}
