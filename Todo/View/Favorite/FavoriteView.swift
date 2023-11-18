//
//  FavoriteView.swift
//  Todo
//
//  Created by 상선 on 11/12/23.
//

import SwiftUI

struct FavoriteView: View {
    @Environment(TaskManager.self) var taskManager
    @State private var isShowDoneTask: Bool = true
    
    var tasks: [TaskModel] { taskManager.tasks.filter { $0.isFavorite && $0.isDone == false} }
    var doneTasks: [TaskModel] {taskManager.tasks.filter { $0.isFavorite && $0.isDone == true } }
    
    var isShowDoneTaskButtonTitle: String {
        isShowDoneTask ? "완료 숨기기" : "완료 보기"
    }
    
    var body: some View {
        @Bindable var taskManager = taskManager
        
        NavigationStack {
            List {
                Section {
                    if tasks.isEmpty {
                        TaskEmptyView()
                    } else {
                        ForEach(tasks) { task in
                            NavigationLink {
                                TaskEditView(task: task)
                            } label: {
                                TaskListItemView(task: task)
                                    .swipeActions {
                                        Button("삭제") {
                                            
                                        }.tint(Color.Todo.red)
                                    }
                            }
                        }
                    }
                    
                } header: {
                    Text("하는 중")
                }
                
                if isShowDoneTask {
                    Section {
                        ForEach(doneTasks) { task in
                            NavigationLink {
                                TaskEditView(task: task)
                            } label: {
                                TaskListItemView(task: task)
                                    .swipeActions {
                                        Button("삭제") {
                                            
                                        }.tint(Color.Todo.red)
                                    }
                            }
                        }
                    } header: {
                        Text("완료")
                    }
                }
            }
            .buttonStyle(.borderless) // 리스트에서 아이템을 탭했을때 모든 버튼들이 이벤트를 동시에 받는 것을 방지
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Star")
                        .font(.Todo.title)
                        .foregroundStyle(Color.Todo.black)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(isShowDoneTaskButtonTitle) {
                        isShowDoneTask.toggle()
                    }
                }
            }
        }
        .overlay(CircleButton().offset(x: -24, y: -24), alignment: .bottomTrailing)
    }
}

#Preview {
    FavoriteView()
}
