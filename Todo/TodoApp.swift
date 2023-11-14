//
//  TodoApp.swift
//  Todo
//
//  Created by 상선 on 11/12/23.
//

import SwiftUI

@main
struct TodoApp: App {
    @State private var taskManager = TaskManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(taskManager)
        }
    }
}
