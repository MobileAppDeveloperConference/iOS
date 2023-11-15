//
//  TaskModel.swift
//  Todo
//
//  Created by 상선 on 11/14/23.
//

import Foundation

struct TaskModel: Identifiable, Hashable {
    let id = UUID()
    
    var task: String
    var description: String
    
    var isDone: Bool = false
    var isFavorite: Bool = false
    
    let date: Date = Date()
    var dateStr: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM월 dd일 E"
        
        return formatter.string(from: date)
    }
}
