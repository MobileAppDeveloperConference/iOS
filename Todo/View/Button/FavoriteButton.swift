//
//  FavoriteButton.swift
//  Todo
//
//  Created by 상선 on 11/15/23.
//

import SwiftUI

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
    FavoriteButton(isFavorite: .constant(false))
}
