//
//  ContentView.swift
//  FirstApp
//
//  Created by Thongchai Subsaidee on 8/6/2564 BE.
//

import SwiftUI

@available(iOS 15.0, *)
struct ContentView: View {
    
    var body: some View {
       PullToRefresView()
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
