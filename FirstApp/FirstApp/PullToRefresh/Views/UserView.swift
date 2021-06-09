//
//  PullToRefresView.swift
//  FirstApp
//
//  Created by Thongchai Subsaidee on 8/6/2564 BE.
//

import SwiftUI

@available(iOS 15.0, *)
struct PullToRefresView: View {
    
    @StateObject private var userVM = UserViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(userVM.users) { user in
                    HStack {
                        Text(user.name)
                        Text(user.password)
                    }
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                }
            }
            .navigationBarTitle("Pull to refresh")
        }
        .refreshable {
            // Todo
//          userVM.fetchUser()
            await userVM.fetchUserAsyncAwait()
        }
        
    }
}

@available(iOS 15.0, *)
struct PullToRefresView_Previews: PreviewProvider {
    static var previews: some View {
        PullToRefresView()
    }
}
