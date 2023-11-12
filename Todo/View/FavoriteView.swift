//
//  FavoriteView.swift
//  Todo
//
//  Created by 상선 on 11/12/23.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        NavigationStack {
            List {
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Star")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("완료 숨기기") {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    FavoriteView()
}
