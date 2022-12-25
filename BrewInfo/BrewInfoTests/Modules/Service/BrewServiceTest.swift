//
//  BrewServiceTest.swift
//  BrewInfoTests
//
//  Created by Shashank Shree on 21/12/22.
//

import XCTest
@testable import BrewInfo

class BrewServiceTest: XCTestCase {

    var brewService: IBrewService!
    var mockNetworkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        brewService = BrewServiceImpl(networkManager: mockNetworkManager)
    }
    
    override func tearDown() {
        brewService = nil
        mockNetworkManager = nil
        super.tearDown()
    }
    
    func testBrewService_Success() {
        let expectation = expectation(description: "Brew Service on Success Case")
        mockNetworkManager.brewList = MockData.brews
        brewService.fetchBrewListFromNetwork { (result: Result<[BrewDataListDTO], Error>) in
            switch result {
            case let .success(brews):
                if brews.count > 0 {
                    expectation.fulfill()
                }
            case .failure(_):
                XCTFail("Failure not expected")
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testBrewService_Failure() {
        let expectation = expectation(description: "Brew Service on Failure Case")
        mockNetworkManager.error = NSError(domain: "FailedError", code: 0)
        brewService.fetchBrewListFromNetwork { (result: Result<[BrewDataListDTO], Error>) in
            switch result {
            case .success(_):
                XCTFail("Success not expected")
            case .failure(_):
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
}


