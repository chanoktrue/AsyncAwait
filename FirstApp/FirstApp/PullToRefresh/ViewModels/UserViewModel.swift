//
//  UserViewModel.swift
//  FirstApp
//
//  Created by Thongchai Subsaidee on 8/6/2564 BE.
//

import SwiftUI

@available(iOS 15.0, *)
class UserViewModel: ObservableObject {
    
    @Published var users: [UserList] = []
    
    let token = "Bearere eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpdGVtcyI6W3sidXNlcm5hbWUiOiJyb2oiLCJwYXNzd29yZCI6IjEyMzQ1NiJ9XSwiaWF0IjoxNjIzMjAzOTYxfQ.9J4o3MyKD-ofG7bHaSOnV6T4wqfqlOKo1xT-mZ-PtPE"
    
    let urlString = "http://homenano.trueddns.com:24349/api/user"
    let urlStringJson = "https://jsonplaceholder.typicode.com/users"
    
    
    func fetchUser() async {
        
        WebService().api(urlString: urlString, token: token) { result in
            switch result {
            case .success(let users):
                print(users)
//                DispatchQueue.main.async {
//                    self.users = users.map(UserList.init)
//                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchUserAsyncAwait() async {

        do{
            let users = try await AsyncAwaitService().api(urlString: urlStringJson)
            print(users)
//            DispatchQueue.main.async {
//                self.users = users.map(UserListJson.init)
//            }
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func fetchUserAsyncAwaitWithToken() async {
        do {
            let users = try await AsyncAwaitService().apiWithToken(urlString: urlString, token: token)
            print(users)
            DispatchQueue.main.async {
                self.users = users.map(UserList.init)
            }
        }catch {
            print(error.localizedDescription)
        }
    }
}

struct UserList: Identifiable {
    let user: User
    let id = UUID()
    
    var name: String {
        user.username
    }
    
    var password: String {
        user.password
    }
}

struct UserListJson: Identifiable {
    let user: UserJson
    let id = UUID()
    
    var name: String {
        return user.name
    }
    
    var password: String {
        return user.email
    }
}


