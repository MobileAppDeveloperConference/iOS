//
//  TaskManager.swift
//  Todo
//
//  Created by 상선 on 11/14/23.
//

import Foundation


protocol Manager {
    var taskList: [TaskModel] { get }
    
    func load() -> [TaskModel]
    func save(task: TaskModel)
    func delete(task: TaskModel)
    func update(task: TaskModel)
}

class TaskManager: Manager {
    private(set) var taskList: [TaskModel]
    
    static let shared = TaskManager()
    
    private init() {
        taskList = []
    }
    
    func load() -> [TaskModel] {
        return taskList
    }
    
    func save(task: TaskModel) {
        taskList.append(task)
    }
    
    func delete(task: TaskModel) {
        taskList = taskList.filter { $0.id != task.id }
    }
    
    func update(task: TaskModel) {
        if let idx = taskList.firstIndex(where: { $0.id == task.id }) {
            taskList[idx] = task
        }
    }
    
    
}
