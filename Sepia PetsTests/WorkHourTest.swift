//
//  WorkHourTest.swift
//  Sepia PetsTests
//
//  Created by Sanoop PM on 30/11/22.
//

import XCTest

final class WorkHourTest: XCTestCase {
    
    var configTime11AM: Settings!
    var configStartDayWednesday: Settings!
    var configAllDay: Settings!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        configTime11AM = Settings(workHours: "M-F 11:00 - 18:00")
        configStartDayWednesday = Settings(workHours: "W-F 9:00 - 18:00")
        configAllDay = Settings(workHours: "S-Sa 1:00 - 24:00")
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        configTime11AM = nil
        configStartDayWednesday = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testConfigTime11AM() {
        XCTAssertTrue(checkWorkingTime(input: configTime11AM.workHours!))
    }
    
    func testStartDayWednesday() {
        XCTAssertTrue(checkWorkingTime(input: configTime11AM.workHours!))
    }
    func testAllDay() {
        XCTAssertTrue(checkWorkingTime(input: configAllDay.workHours!))
    }
}
