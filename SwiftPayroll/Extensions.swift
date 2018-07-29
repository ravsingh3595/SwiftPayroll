//
//  Extensions.swift
//  SwiftPayroll
//
//  Created by Sonia Rani on 2018-07-28.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation

extension Double{
    func appendingCurrency() -> String {
        return "$" + String(self)    }
}
