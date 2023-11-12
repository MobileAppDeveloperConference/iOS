//
//  ContentView.swift
//  Todo
//
//  Created by 상선 on 11/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            MainView()
                .tabItem {
                    if selectedIndex == 0 {
                        Image("ic_tap_home_fill")
                    } else {
                        Image("ic_tap_home")
                    }
                    Text("기본")
                }
                .tag(0)
                
            
            FavoriteView()
                .tabItem {
                    if selectedIndex == 1 {
                        Image("ic_tap_star_fill")
                    } else {
                        Image("ic_tap_star")
                    }
                    Text("중요")
                }
                .tag(1)
        }
        .accentColor(.Todo.black)
        
    }
}

#Preview {
    ContentView()
}
