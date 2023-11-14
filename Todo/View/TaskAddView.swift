//
//  TaskAddView.swift
//  Todo
//
//  Created by 상선 on 11/12/23.
//

import SwiftUI

struct TaskAddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(TaskManager.self) var taskManager
    
    @State private var isFavorite: Bool = false
    
    @State private var task: String = ""
    @State private var desc: String = ""
    
    @FocusState private var taskFocus: Bool
    @FocusState private var descFocus: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("투두를 입력해주세요.", text: $task)
//                    .textFieldStyle(.roundedBorder)
                    .frame(height: 64)
                    .background(Color.Todo.grayFry)
                    .padding([.bottom], 16)
                    .focused($taskFocus)
                    .onSubmit {
                        taskFocus = false
                    }
                
                TextField("원한다면 투두에 설명도 추가할 수 있어요.", text: $desc, axis: .vertical)
//                    .textFieldStyle(.roundedBorder)
                    .lineLimit(2...)
//                    .frame(height: 336)
                    
                    .background(Color.Todo.grayFry)
                    .focused($descFocus)
                    .onSubmit {
                        descFocus = false
                    }
                
                Spacer()
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Text("Add task")
                        .font(.Todo.title)
                        .foregroundStyle(Color.Todo.black)
                    Button {
                        isFavorite.toggle()
                    } label: {
                        Image(isFavorite ? "ic_tap_star_fill" : "ic_tap_star")
                            .foregroundStyle(isFavorite ? Color.Todo.red : Color.Todo.black)
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("취소") {
                        dismiss()
                    }
                    Button("완료") {
                        let taskModel = TaskModel(task: task, description: desc)
                        taskManager.save(task: taskModel)
                        dismiss()
                    }
                    
                }
            }
            .padding(EdgeInsets(top: 32, leading: 16, bottom: 16, trailing: 16))
        }
    }
}

#Preview {
    TaskAddView()
}
