//
//  TodoApp.swift
//  Todo
//
//  Created by 상선 on 11/12/23.
//

import SwiftUI

@main
struct TodoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    getFpont()
                }
        }
    }
    
    func getFpont() {
        UIFont.familyNames.forEach{ print($0); UIFont.fontNames(forFamilyName: $0).forEach{ print("  ", $0) } }
    }
}
