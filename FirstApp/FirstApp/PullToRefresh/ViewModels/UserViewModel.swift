//
//  UserViewModel.swift
//  FirstApp
//
//  Created by Thongchai Subsaidee on 8/6/2564 BE.
//

import SwiftUI

@available(iOS 15.0, *)
class UserViewModel: ObservableObject {
    
    @Published var users: [UserListJson] = []
    
    func fetchUser() async {
        let urlString = "http://homenano.trueddns.com:24349/api/user"
        
        WebService().api(urlString: urlString) { result in
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
            let users = try await AsyncAwaitService().api()
            print(users)
            DispatchQueue.main.async {
                self.users = users.map(UserListJson.init)
            }
        }catch{
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


