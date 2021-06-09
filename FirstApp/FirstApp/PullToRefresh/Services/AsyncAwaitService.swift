//
//  AsyncAwaitService.swift
//  FirstApp
//
//  Created by Thongchai Subsaidee on 9/6/2564 BE.
//

import SwiftUI

@available(iOS 15.0, *)
struct AsyncAwaitService {
    
    func api() async throws -> [UserJson] {
        
        let urlString = "https://jsonplaceholder.typicode.com/users"
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.InvalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let users = try JSONDecoder().decode([UserJson].self, from: data)
        
        return users 
    }
    
}
