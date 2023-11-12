//
//  CircleButton.swift
//  Todo
//
//  Created by 상선 on 11/12/23.
//

import SwiftUI

struct CircleButton: View {
    var body: some View {
        Circle()
            .frame(width: 66, height: 66)
            .overlay(
                Image("btn_add")
            )
            .foregroundStyle(Color.Todo.red)
            .onTapGesture {
                print("tapped")
            }
    }
}

#Preview {
    CircleButton()
}
