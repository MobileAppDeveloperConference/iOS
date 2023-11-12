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
                Section {
                    TaskEmptyView()
                } header: {
                    Text("하는중")
                }
                
                Section {
                    
                } header: {
                    Text("완료")
                }
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
