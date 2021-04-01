//
//  user.swift
//  health-app
//
//  Created by 里見健太 on 2021/04/01.
//

import Foundation

// USAGE:   let users = try? newJSONDecoder().decode(Users.self, from: jsonData)

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let name, username, email: String
    let address: Address
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

typealias Users = [User]
