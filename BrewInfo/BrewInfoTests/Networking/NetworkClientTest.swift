//
//  NetworkClientTest.swift
//  BrewInfoTests
//
//  Created by Shashank Shree on 21/12/22.
//

import XCTest
@testable import BrewInfo

final class NetworkClientTests: XCTestCase {

    var networkManger: INetworkManager!
    let testUrl = URL(string: "TestURL")!
    
    override func setUpWithError() throws {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        
        let urlSession = URLSession.init(configuration: configuration)
        networkManger = NetworkManager(session: urlSession)
    }
    
    func testSuccessfulResponse() {
        let expecatation = expectation(description: "Success")
        let data = loadJsonData(file: "BrewInfo")
        
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url, url == self.testUrl else {
                throw NSError(domain: "URL", code: NSURLErrorBadURL, userInfo: nil)
            }
            
            let response = HTTPURLResponse(url: self.testUrl, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        networkManger.request(fromUrl: testUrl) {(result: Result<[BrewDataListDTO], Error>) in
            switch result {
            case let .success(brewList):
                let count = brewList.count
                if count > 0 {
                    expecatation.fulfill()
                }
            case let .failure(error):
                XCTFail("Failure not expected \(error.localizedDescription)")
            }
        }
        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testNetworkRequestFailure() {
        let errorExpectation = expectation(description: "Network Request Failed")
        let data = Data()
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: self.testUrl, statusCode: 400, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        networkManger.request(fromUrl: testUrl) { (result: Result<BrewDataListDTO, Error>) in
            switch result {
            case .success(_):
                XCTFail("Success response was not expected.")
            case let .failure(error):
                XCTAssertEqual(error as! NetworkError, NetworkError.failed)
                XCTAssertEqual((error as! NetworkError).description, "Network Request Failed")
                errorExpectation.fulfill()
            }
        }
        wait(for: [errorExpectation], timeout: 1.0)
    }

    private func loadJsonData(file: String) -> Data? {
        if let jsonFilePath = Bundle(for: type(of: self)).path(forResource: file, ofType: "json") {
            let jsonFileURL = URL(fileURLWithPath: jsonFilePath)
            if let jsonData = try? Data(contentsOf: jsonFileURL) {
                return jsonData
            }
        }
        return nil
    }
}
