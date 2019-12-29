//
//  GrabIndiaTests.swift
//  GrabIndia
//
//  Created by Gudisi, Sreekanth on 14/12/19.
//  Copyright © 2019 Gudisi, Sreekanth. All rights reserved.
//

import XCTest
@testable import GrabIndia

class GrabIndiaTests: XCTestCase {

    var vc : ViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        vc = (storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // Checking here TableView is there or not
    func testInitMyTableView() {
        
        XCTAssertNotNil(vc.tableview)
    }

    // Checking here TableView Data Source included or not
    func testDataSourceToTableView() {
        
        XCTAssertTrue((vc.tableview.dataSource is ViewController))
    }
    
    // Checking here TableView Delegate included or not
    func testDelegateToTableView() {
        
        XCTAssertTrue((vc.tableview.delegate is ViewController))
    }
    
    // Checking here TableView Data Source aand Delegate included or not
    func testDataSourceAndDelegateToTableView() {
        
        XCTAssertEqual(vc.tableview.dataSource is ViewController, vc.tableview.delegate is ViewController)
    }
}
