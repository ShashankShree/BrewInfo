//
//  BrewUseCaseTest.swift
//  BrewInfoTests
//
//  Created by Shashank Shree on 21/12/22.
//

import XCTest
@testable import BrewInfo

final class BrewUseCaseTest: XCTestCase {
    
    var brewUseCase: IBrewUseCase!
    var mockBrewRepository: MockBrewRepository!
    
    override func setUp() {
        super.setUp()
        mockBrewRepository = MockBrewRepository()
        brewUseCase = BrewUseCaseImpl(respository: mockBrewRepository)
    }
    
    override func tearDown() {
        brewUseCase = nil
        mockBrewRepository = nil
        super.tearDown()
    }
    
    func testBrewUseCaseSuccess() {
        let expectation = expectation(description: "BrewUseCase Success Case")
        mockBrewRepository.brewList = MockData.domainBrews
        brewUseCase.fetchBrewList { (result: Result<[BrewItem], Error>) in
            switch result {
            case let .success(brew):
                XCTAssertTrue(brew.count == 25)
                expectation.fulfill()
            case .failure(_):
                XCTFail("Failure not expected")
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testBrewUseCaseFailure() {
        let expectation = expectation(description: "BrewUseCase Failure Case")
        mockBrewRepository.error = NSError(domain: "Failed_Error", code: 0)
        brewUseCase.fetchBrewList { (result: Result<[BrewItem], Error>) in
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
