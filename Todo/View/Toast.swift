//
//  Toast.swift
//  Todo
//
//  Created by 상선 on 11/18/23.
//

import SwiftUI

struct Toast: View {
    
    var message: String
    
    var body: some View {
        HStack {
            Text(message)
                .frame(height: 48, alignment: .center)
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color.Todo.show)
                .font(.Todo.r16)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.Todo.red)
                )
        }.padding([.leading, .trailing], 16)
    }
}

#Preview {
    Toast(message: "Toast")
}
