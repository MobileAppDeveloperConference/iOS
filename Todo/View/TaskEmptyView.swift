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
                Image(systemName: "photo")
                Text("투두를 추가해보세요.")
            }
            Spacer()
        }
    }
}

#Preview {
    TaskEmptyView()
}
