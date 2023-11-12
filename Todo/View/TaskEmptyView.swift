//
//  TaskEmptyView.swift
//  Todo
//
//  Created by 상선 on 11/12/23.
//

import SwiftUI

struct TaskEmptyView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Image("ic_Doo_empty")
                Text("투두를 추가해보세요.")
                    .font(.Todo.m13)
                    .foregroundStyle(Color.Todo.skyblue)
                    
            }
            Spacer()
        }
        .background(Color.Todo.ashblue)
    }
}

#Preview {
    TaskEmptyView()
}
