//
//  TaskAddView.swift
//  Todo
//
//  Created by 상선 on 11/12/23.
//

import SwiftUI
import PopupView

struct TaskAddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(TaskManager.self) var taskManager
    
    @State private var isFavorite: Bool = false
    @State private var showToast: Bool = false {
        didSet {
            print("showToast : \(showToast)")
        }
    }
    
    @State private var task: String = ""
    @State private var desc: String = ""
    
    @FocusState private var taskFocus: Bool
    @FocusState private var descFocus: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("투두를 입력해주세요.", text: $task)
                    .frame(height: 64)
                    .background(Color.Todo.grayFry)
                    .padding([.bottom], 16)
                    .focused($taskFocus)
                    .onSubmit {
                        taskFocus = false
                    }
                    .onChange(of: task) { oldValue, newValue in
                        if newValue.count > 29 {
                            showToast = newValue.count > 29
                            task = String(task.dropLast())
                        }
                    }
                
                TextField("원한다면 투두에 설명도 추가할 수 있어요.", text: $desc, axis: .vertical)
                    .frame(height: 330, alignment: .top)
                    .lineLimit(2...)
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
                        showToast.toggle()
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
        .popup(isPresented: $showToast) {
            Toast(message: "이제는 더이상 입력할 곳이 없다")
        } customize: {
            $0
                .type (.floater())
                .position(.bottom)
                .autohideIn(2)
                .dismissCallback {
                    showToast = false
                }
        }
    }
}

#Preview {
    TaskAddView()
}

