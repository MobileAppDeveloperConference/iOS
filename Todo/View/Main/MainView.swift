//
//  MainView.swift
//  Todo
//
//  Created by 상선 on 11/12/23.
//

import SwiftUI

struct MainView: View {
    @Environment(TaskManager.self) var taskManager
    
    var body: some View {
        @Bindable var taskManager = taskManager
        
        NavigationStack {
            List {
                Section {
                    if taskManager.tasks.isEmpty {
                        TaskEmptyView()
                    } else {
                        ForEach(taskManager.tasks) {
                            TaskListItemView(task: $0)
                                .swipeActions {
                                    Button("삭제") {
                                        
                                    }.tint(Color.Todo.red)
                                }
                        }
                    }
                    
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
        .overlay(CircleButton().offset(x: -24, y: -24), alignment: .bottomTrailing)
    }
}

#Preview {
    MainView()
}
