//
//  TaskModel.swift
//  Todo
//
//  Created by 상선 on 11/14/23.
//

import Foundation

struct TaskModel: Identifiable {
    let id = UUID()
    
    let task: String
    let description: String
    
    var isDone: Bool = false
    var isFavorite: Bool = false
    
    let date: Date = Date()
}
