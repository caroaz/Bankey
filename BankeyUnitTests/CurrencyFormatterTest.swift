//
//  CurrencyFormatterTest.swift
//  BankeyUnitTests
//
//  Created by CLS7377387-MOBD on 06-10-22.
//

import Foundation
import XCTest
@testable import Bankey


class CurrencyFormatterTests: XCTestCase {
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testBreakDollarsIntoCents() throws {
        let result = formatter.breakIntoDollarsAndCents(929466.23)
        XCTAssertEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "23")
    }
    
    func testDollarsFormatted() throws {
            let result = formatter.dollarsFormatted(929466.23)
            XCTAssertEqual(result, "$929,466.23")
        }
    
    func testZeroDollarsFormatted() throws {
           let result = formatter.dollarsFormatted(0.00)
           XCTAssertEqual(result, "$0.00")
       }
    
    func testDollarsWhitCurrencySymbol() throws {
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol! //si es euro u otra moneda
        
        let result = formatter.dollarsFormatted(929466.23)
        XCTAssertEqual(result, "\(currencySymbol)929,466.23")
        
    }
}
