//
//  MainView.swift
//  Todo
//
//  Created by 상선 on 11/12/23.
//

import SwiftUI

struct MainView: View {
    @Environment(TaskManager.self) var taskManager
    @State private var isShowDoneTask: Bool = true
    
    var tasks: [TaskModel] { taskManager.tasks.filter { $0.isDone == false } }
    var doneTasks: [TaskModel] {taskManager.tasks.filter { $0.isDone == true } }
    
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
                            }
                            .swipeActions {
                                Button("삭제") {
                                    taskManager.delete(task: task)
                                }.tint(Color.Todo.red)
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
                                            taskManager.delete(task: task)
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
                    Text("Todoo")
                        .font(.Todo.title)
                        .foregroundStyle(Color.Todo.black)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowDoneTask.toggle()
                    } label: {
                        Text(isShowDoneTaskButtonTitle)
                            .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                            .font(.Todo.m13)
                            .foregroundStyle(Color.Todo.snow)
                            .background(
                                RoundedRectangle(cornerRadius: 3)
                                    .fill(isShowDoneTask ? Color.Todo.black : Color.Todo.red)
                            )
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
