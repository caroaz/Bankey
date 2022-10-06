//
//  DecimalUtils.swift
//  Bankey
//
//  Created by CLS7377387-MOBD on 05-10-22.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
