//
//  TestAPIServiceClass.swift
//  GitConnectionWithXcodeTests
//
//  Created by Auropriya Sinha on 19/09/22.
//

import XCTest
@testable import GitConnectionWithXcode

class TestAPIServiceClass: XCTestCase {

    func testValidUrlReqReturnsSuccess() {
        let apiService = APIService()
        let expectation = self.expectation(description: "ValidRequest_Returns_LoginResponse")
        
        apiService.fetch { usersArray in
            XCTAssertNotNil(usersArray)
            XCTAssertGreaterThan(usersArray.count, 0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
    
    func testInvalidURLReturnFaliure() {
        let apiService = APIService()
        apiService.urlString = "https://jsonplaceholder.typicode.com/us"
        
        let expectation = self.expectation(description: "InvalidURL_Returns_Failure")

        apiService.fetch { usersArray in
            XCTAssertNotNil(usersArray)
            XCTAssertEqual(usersArray.count, 0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
}
