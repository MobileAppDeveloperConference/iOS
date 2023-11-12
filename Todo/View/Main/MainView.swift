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
//                    TaskEmptyView()
                    TaskListItemView()
                } header: {
                    Text("하는 중")
                }
                
                Section {
                    
                } header: {
                    Text("완료")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Todoo")
                        .font(.Todo.title)
                        .foregroundStyle(Color.Todo.black)
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
