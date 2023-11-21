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

    var body: some View {
        @Bindable var taskManager = taskManager
        let taskIndex = taskManager.getTaskIndexBy(task: task)
        
        if taskIndex == -1 {
        } else {
            HStack {
                DoneButton(isDone: $taskManager.tasks[taskIndex].isDone)
                
                Text("\(task.task)")
                    .font(.Todo.r16)
                    .lineLimit(1)
                
                Spacer()
                
                FavoriteButton(isFavorite: $taskManager.tasks[taskIndex].isFavorite)
            }
            .padding([.leading, .trailing], 16)
            .frame(height: 64)
        }
    }
}

#Preview {
    TaskListItemView(task: TaskModel(task: "테스트", description: "설명"))
}
