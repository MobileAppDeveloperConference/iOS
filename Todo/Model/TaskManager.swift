//
//  TaskManager.swift
//  Todo
//
//  Created by 상선 on 11/14/23.
//

import Foundation


@Observable
class TaskManager {
    var tasks: [TaskModel]
    var repo: any TaskRepository
    
    init(repo: any TaskRepository) {
        tasks = []
        tasks = repo.load()
        
        self.repo = repo
    }

    func getTaskIndexBy(task: TaskModel) -> Int {
        return tasks.firstIndex(where: { $0.id == task.id }) ?? -1
    }
    
    func save(task: TaskModel) {
        repo.save(task: task)
    }
    
    func delete(task: TaskModel) {
        repo.delete(task: task)
    }
}
