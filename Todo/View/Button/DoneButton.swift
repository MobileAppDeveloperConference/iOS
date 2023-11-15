//
//  DoneButton.swift
//  Todo
//
//  Created by 상선 on 11/15/23.
//

import SwiftUI

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

#Preview {
    DoneButton(isDone: .constant(false))
}
