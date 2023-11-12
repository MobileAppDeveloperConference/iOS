//
//  TaskAddView.swift
//  Todo
//
//  Created by 상선 on 11/12/23.
//

import SwiftUI

struct TaskAddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var isFavorite: Bool = false
    
    @State private var task: String = ""
    @State private var desc: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("투두를 입력해주세요.", text: $task)
//                    .textFieldStyle(.roundedBorder)
                    .frame(height: 64)
                    .background(Color.Todo.grayFry)
                    .padding([.bottom], 16)
                TextField("원한다면 투두에 설명도 추가할 수 있어요.", text: $desc, axis: .vertical)
//                    .textFieldStyle(.roundedBorder)
                    .frame(height: 336)
                    .background(Color.Todo.grayFry)
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
