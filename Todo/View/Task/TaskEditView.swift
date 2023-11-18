//
//  TaskEditView.swift
//  Todo
//
//  Created by 상선 on 11/15/23.
//

import SwiftUI

struct TaskEditView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(TaskManager.self) var taskManager
    
    var task: TaskModel
    
    @FocusState private var taskFocus: Bool
    @FocusState private var descFocus: Bool
    
    var body: some View {
        @Bindable var taskManager = taskManager
        
        let taskIndex = taskManager.getTaskIndexBy(task: task)
        
        if  taskIndex == -1 {
        } else {
            NavigationStack {
                VStack {
                    HStack {
                        DoneButton(isDone: $taskManager.tasks[taskIndex].isDone)
                        
                        Spacer()
                        
                        Text(task.dateStr)
                        
                        Spacer()
                        
                        Button {
                            taskManager.delete(task: task)
                            dismiss()
                        } label: {
                            Text("안할래")
                        }
                        
                    }
                    
                    TextField("", text: $taskManager.tasks[taskIndex].task)
                        .frame(height: 64)
                        .background(Color.Todo.grayFry)
                        .padding([.bottom], 16)
                        .focused($taskFocus)
                        .onSubmit {
                            taskFocus = false
                        }
                    
                    TextField("", text: $taskManager.tasks[taskIndex].description, axis: .vertical)
                        .frame(height: 330, alignment: .top)
                        .lineLimit(2...)
                        .foregroundColor(Color.Todo.black)
                        .background(Color.Todo.grayFry)
                        .focused($descFocus)
                        .onSubmit {
                            descFocus = false
                        }
                    
                    Spacer()
                }
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Text("Task")
                            .font(.Todo.title)
                            .foregroundStyle(Color.Todo.black)
                        FavoriteButton(isFavorite: $taskManager.tasks[taskIndex].isFavorite)
                    }
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button("닫기") {
                            dismiss()
                        }
                    }
                }
                .navigationBarBackButtonHidden()
                .padding(EdgeInsets(top: 32, leading: 16, bottom: 16, trailing: 16))
            }
        }
    }
}

#Preview {
    TaskEditView(task: TaskModel(task: "", description: ""))
}
