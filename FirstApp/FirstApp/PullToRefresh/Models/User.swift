//
//  User.swift
//  FirstApp
//
//  Created by Thongchai Subsaidee on 8/6/2564 BE.
//

import Foundation

struct User: Codable{
    let username: String
    let password: String
}

struct UserJson: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
