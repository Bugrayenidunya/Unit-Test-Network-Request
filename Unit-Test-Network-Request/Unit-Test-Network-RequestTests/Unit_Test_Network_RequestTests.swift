//
//  Unit_Test_Network_RequestTests.swift
//  Unit-Test-Network-RequestTests
//
//  Created by Enes Buğra Yenidünya on 31.08.2022.
//

import XCTest
@testable import Unit_Test_Network_Request

class Unit_Test_Network_RequestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetUser_withValidURL_shouldReturnUsers() {
        // Arrange
        let sut = makeSUT()
        
        // Act
        let mockUser = User(id: 0, name: "Bugra", username: "bugrayndny", email: "", phone: "", website: "")
        injectMockData(user: mockUser)

        let exp = expectation(description: "Wait for response")
        let requestModel = UserRequestModel()
        
        // Assert
        sut.retriveUser(request: requestModel) { result in
            defer { exp.fulfill() }
            
            switch result {
            case .success(let users):
                XCTAssertTrue(!users.isEmpty, "Expected Users array instead found empty \(users)")
                
            case .failure(let error):
                XCTAssertNil(error, "Error should be nil instead found \(error)")
            }
        }
        
        wait(for: [exp], timeout: 1.0)
    }
    
    // MARK: - Helpers
    private func makeSUT() -> UserAPI {
        URLProtocol.registerClass(MockURLProtocol.self)
        
        let urlSessionConfiguration = URLSessionConfiguration.default
        urlSessionConfiguration.protocolClasses?.insert(MockURLProtocol.self, at: .zero)
        
        let urlSession = URLSession(configuration: urlSessionConfiguration)
        let networkManager = NetworkManager(session: urlSession)

        return UserAPI(networkManager: networkManager)
    }
    
    private func injectMockData(user: User) {
        let mockUsers = [user]
        let mockData = try? JSONEncoder().encode(mockUsers)
        
        MockURLProtocol.requestHandler = { request in
            return (HTTPURLResponse(), mockData!)
        }
    }
}
