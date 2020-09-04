//
//  contactsTests.swift
//  contactsTests
//
//  Created by Ryniere dos Santos Silva on 2020-09-02.
//  Copyright © 2020 Ryniere dos Santos Silva. All rights reserved.
//

import XCTest
@testable import MyContacts

class contactsTests: XCTestCase {
    
    let contactListViewModel = ContactListViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialContactCount() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(contactListViewModel.contacts.count, 0, "Initial count for contacts is incorrect")
    }
    
    func testContactCount() throws {
        contactListViewModel.fetchContacts()
        XCTAssertEqual(contactListViewModel.contacts.count > 0, true, "count for contacts is incorrect")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
