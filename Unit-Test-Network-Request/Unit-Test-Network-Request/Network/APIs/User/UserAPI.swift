//
//  UserAPI.swift
//  Unit-Test-Network-RequestTests
//
//  Created by Enes Buğra Yenidünya on 31.08.2022.
//

import Foundation

// MARK: - UserFetchable
protocol UserFetchable {
    func retriveUser(request: UserRequestModel, completion: @escaping (Result<[User], ApiError>) -> Void)
}

// MARK: - UserAPI
final class UserAPI: UserFetchable {
    
    // MARK: Properties
    private let networkManager: Networking
    
    // MARK: Init
    init(networkManager: Networking) {
        self.networkManager = networkManager
    }
    
    func retriveUser(request: UserRequestModel, completion: @escaping (Result<[User], ApiError>) -> Void) {
        networkManager.request(request: request, completion: completion)
    }
}
