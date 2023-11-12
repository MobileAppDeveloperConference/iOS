//
//  MainView.swift
//  Todo
//
//  Created by 상선 on 11/12/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            List {
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Todo")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("완료 숨기기") {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}
