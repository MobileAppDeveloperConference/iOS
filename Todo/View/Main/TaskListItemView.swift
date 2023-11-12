//
//  TaskListItemView.swift
//  Todo
//
//  Created by 상선 on 11/12/23.
//

import SwiftUI

struct TaskListItemView: View {
    
    @State private var isDone: Bool = false
    @State private var isFavorite: Bool = false
    
    var body: some View {
        HStack {
            Button {
                isDone.toggle()
            } label: {
                Image(isDone ? "ic_notyet_fill" : "ic_notyet")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            
            Text("Todo 아이템")
                .font(.Todo.r16)
                .lineLimit(1)
            
            Spacer()
            
            Button {
                isFavorite.toggle()
            } label: {
                Image(isFavorite ? "ic_tap_star_fill" : "ic_tap_star")
                    .foregroundStyle(isFavorite ? Color.Todo.red : Color.Todo.black)
            }
            
        }
        .buttonStyle(.borderless) // 리스트에서 아이템을 탭했을때 모든 버튼들이 이벤트를 동시에 받는 것을 방지
    }
}

#Preview {
    TaskListItemView()
}
