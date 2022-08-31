//
//  User.swift
//  Unit-Test-Network-RequestTests
//
//  Created by Enes Buğra Yenidünya on 31.08.2022.
//

import Foundation

struct User: Codable, Hashable {
    let id: Int?
    let name: String?
    let username: String?
    let email: String?
    let phone: String?
    let website: String?
}
