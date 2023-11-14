//
//  TaskManager.swift
//  Todo
//
//  Created by 상선 on 11/14/23.
//

import Foundation


protocol Manager {
    var tasks: [TaskModel] { get }
    
    func load() -> [TaskModel]
    func save(task: TaskModel)
    func delete(task: TaskModel)
    func update(task: TaskModel)
}

@Observable
class TaskManager: Manager {
    private(set) var tasks: [TaskModel]
    
    init() {
        tasks = []
    }
    
    func load() -> [TaskModel] {
        return tasks
    }
    
    func save(task: TaskModel) {
        tasks.append(task)
    }
    
    func delete(task: TaskModel) {
        tasks = tasks.filter { $0.id != task.id }
    }
    
    func update(task: TaskModel) {
        if let idx = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[idx] = task
        }
    }
    
}
