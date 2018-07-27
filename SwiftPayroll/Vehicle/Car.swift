//
//  Car.swift
//  SwiftPayroll
//
//  Created by Veerpal on 2018-07-25.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation

class Car: Vehicle
{
    var bootSpace: Double?
    
    init(make: String, plate: String, bootSpace: Double)
    {
        super.init(make: make, plate: plate)
        self.bootSpace = bootSpace
    }
    
    override func printMyData() {
        super.printMyData()
        print("Boot Space: \(bootSpace!)")
    }
}
