//
//  BrewRepositoryTest.swift
//  BrewInfoTests
//
//  Created by Shashank Shree on 21/12/22.
//

import XCTest
@testable import BrewInfo

final class BrewRepositoryTest: XCTestCase {

    var brewRepository: IBrewRepository!
    var mockBrewService: MockBrewService!
    
    override func setUp() {
        super.setUp()
        mockBrewService = MockBrewService()
        brewRepository = BrewRepositoryImpl(service: mockBrewService)
    }
    
    override func tearDown() {
        brewRepository = nil
        mockBrewService = nil
        super.tearDown()
    }
    
    func testBrewRepository_Success() {
        let expectation = expectation(description: "Brew Repository of Success Case")
        mockBrewService.response = MockData.brews
        mockBrewService.fetchBrewListFromNetwork { (result: Result<[BrewDataListDTO], Error>) in
            switch result {
            case let .success(response):
                if response.count > 0 {
                    expectation.fulfill()
                }
            case .failure(_):
                XCTFail("Failure not expected")
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testBrewRepository_Failure() {
        let expectation = expectation(description: "Brew Repositoy of Failure Case")
        mockBrewService.error = NetworkError.failed
        mockBrewService.fetchBrewListFromNetwork { (result: Result<[BrewDataListDTO], Error>) in
            switch result {
            case .success(_):
                XCTFail("Success not expected")
            case let .failure(error):
                XCTAssertEqual(error as! NetworkError, NetworkError.failed)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
}

