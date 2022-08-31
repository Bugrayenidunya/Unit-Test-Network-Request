//
//  UserRequestModel.swift
//  Unit-Test-Network-RequestTests
//
//  Created by Enes Buğra Yenidünya on 31.08.2022.
//

import Foundation

final class UserRequestModel: RequestModel {
    
    override init() { }
    
    override var path: String {
        "/users"
    }
    
    override var method: RequestMethod {
        .get
    }
}
