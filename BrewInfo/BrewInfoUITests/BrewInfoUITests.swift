//
//  BrewInfoUITests.swift
//  BrewInfoUITests
//
//  Created by Shashank Shree on 21/12/22.
//

import XCTest

final class BrewInfoUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testTableView() {
        app.launch()
        let brewListTableView = app.tables["table--brewListTableView"]
        XCTAssertTrue(brewListTableView.exists, "The brew list tableview exists")
        
        let tableCells = brewListTableView.cells
        XCTAssert(tableCells.element.waitForExistence(timeout: 5.0))
        if tableCells.count > 0 {
            let count: Int = (tableCells.count - 1)
            let expectation = expectation(description: "Wait for table cells")
            for i in stride(from: 0, to: count , by: 1) {
                let tableCell = tableCells.element(boundBy: i)
                XCTAssertTrue(tableCell.exists, "The \(i) cell is in place on the table")
                if i == (count - 1) {
                    expectation.fulfill()
                }
            }
            waitForExpectations(timeout: 10, handler: nil)
            XCTAssertTrue(true, "Finished validating the table cells")
        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }
    }
}
