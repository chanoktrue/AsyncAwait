//
//  AsyncAwaitService.swift
//  FirstApp
//
//  Created by Thongchai Subsaidee on 9/6/2564 BE.
//

import SwiftUI

@available(iOS 15.0, *)
struct AsyncAwaitService {
    
    func api(urlString: String) async throws -> [UserJson] {
        guard let url = URL(string: urlString) else {
            throw NetworkError.InvalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let users = try JSONDecoder().decode([UserJson].self, from: data)
        return users 
    }
    
    func apiWithToken(urlString: String, token: String) async throws -> [User] {
        guard let url = URL(string: urlString) else {
            throw NetworkError.InvalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let users = try JSONDecoder().decode([User].self, from: data)
        return users
        
    }
    
    
}
