//
//  ContentView.swift
//  Todo
//
//  Created by 상선 on 11/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("기본")
                }
            FavoriteView()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("중요")
                }
        }
    }
}

#Preview {
    ContentView()
}
