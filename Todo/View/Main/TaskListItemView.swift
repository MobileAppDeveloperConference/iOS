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
    
    var taskIndex: Int {
        taskManager.tasks.firstIndex(where: { $0.id == task.id })!
    }

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

struct DoneButton: View {
    @Binding var isDone: Bool
    
    var body: some View {
        Button {
            isDone.toggle()
        } label: {
            Image(isDone ? "ic_notyet_fill" : "ic_notyet")
                .resizable()
                .frame(width: 30, height: 30)
        }
    }
}

struct FavoriteButton: View {
    @Binding var isFavorite: Bool
    
    var body: some View {
        Button {
            isFavorite.toggle()
        } label: {
            Image(isFavorite ? "ic_tap_star_fill" : "ic_tap_star")
                .foregroundStyle(isFavorite ? Color.Todo.red : Color.Todo.black)
        }
    }
}

#Preview {
    TaskListItemView(task: TaskModel(task: "테스트", description: "설명"))
}
