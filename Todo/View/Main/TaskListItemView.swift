//
//  TaskListItemView.swift
//  Todo
//
//  Created by 상선 on 11/12/23.
//

import SwiftUI

struct TaskListItemView: View {
    @Environment(TaskManager.self) var taskManager
    
    var task: TaskModel
    var taskIndex: Int 

    var body: some View {
        @Bindable var taskManager = taskManager
        
        HStack {
            DoneButton(isDone: $taskManager.tasks[taskIndex].isDone)
            
            Text(task.task)
                .font(.Todo.r16)
                .lineLimit(1)
            
            Spacer()
            
            FavoriteButton(isFavorite: $taskManager.tasks[taskIndex].isFavorite)
        }
    }
}

#Preview {
    TaskListItemView(task: TaskModel(task: "테스트", description: "설명"), taskIndex: 0)
}
