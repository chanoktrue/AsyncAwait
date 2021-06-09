//
//  WebService.swift
//  FirstApp
//
//  Created by Thongchai Subsaidee on 8/6/2564 BE.
//

import SwiftUI

enum NetworkError: Error {
    case InvalidURL
    case noData
    case customer(errrMessage: String)
}

struct CreateToken: Codable {
    let token: String
}

@available(iOS 15.0, *)
struct WebService {
        
    func api(urlString: String, completion: @escaping (Result<[User], NetworkError>) -> ()) {
        
        let token = "Bearere eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpdGVtcyI6W3sidXNlcm5hbWUiOiJyb2oiLCJwYXNzd29yZCI6IjEyMzQ1NiJ9XSwiaWF0IjoxNjIzMjAzOTYxfQ.9J4o3MyKD-ofG7bHaSOnV6T4wqfqlOKo1xT-mZ-PtPE"

        guard let url = URL(string: urlString) else {
            completion(.failure(.InvalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, respone, error in
                        
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            guard let users = try? JSONDecoder().decode([User].self, from: data) else {
                completion(.failure(.customer(errrMessage: "Json decode error")))
                return
            }
            
            completion(.success(users))
            
        }
        
        task.resume()
       
        
    }

}
