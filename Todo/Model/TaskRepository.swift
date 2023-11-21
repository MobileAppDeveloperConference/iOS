//
//  TaskRepository.swift
//  Todo
//
//  Created by 상선 on 11/22/23.
//

import Foundation

protocol TaskRepository {
//    associatedtype Model: Identifiable
    var tasks: [TaskModel] { get }
    
    func load() -> [TaskModel]
    func save(task: TaskModel)
    func delete(task: TaskModel)
    func update(task: TaskModel)
}

class MemoryTaskRepository: TaskRepository {
//    typealias Model = TaskModel
    private(set) var tasks: [TaskModel] = []
    
    func load() -> [TaskModel] {
        let dummy = loadDummyTask()
        return dummy
    }
    
    func save(task: TaskModel) {
        tasks.append(task)
    }
    
    func delete(task: TaskModel) {
        tasks.removeAll { task.id == $0.id }
    }
    
    func update(task: TaskModel) {
        if let idx = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[idx] = task
        }
    }
}


func loadDummyTask() -> [TaskModel] {
    let title = [
          "아름다운 날씨",
          "푸르른 하늘",
          "산뜻한 봄바람",
          "작은 꽃 피어남",
          "햇살 가득한 날",
          "달콤한 커피 향기",
          "좋은 일만 있기를",
          "함께하는 행복한 시간",
          "신나는 음악 소리",
          "평화로운 마음"
      ]
    let descriptions = [
            "바다에서 바람이 솔솔 부는 날, 작은 섬에 한 소녀가 살았다.",
            "가로등이 갈고리처럼 숨어있는 어둠 속, 도시는 잠들어가고 있었다.",
            "숲 속에서 나무들이 자신의 얘기를 속삭이듯, 나뭇잎이 춤을 추었다.",
            "고요한 밤, 별들은 하늘에 흩어져 있었고, 하나의 별은 빛나고 있었다.",
            "길을 걷다가 발밑에 꽃잎이 흩날리며 나를 반겨주었다.",
            "눈이 내려오는 날, 동네 사람들은 눈싸움을 즐기며 웃고 있었다.",
            "어린 왕자는 노란 장미꽃을 만나러 행성을 여행하고 다녔다.",
            "작은 창가에 앉아 차 한 잔을 마시며, 비오는 날의 여유를 즐겼다.",
            "시간이 멈춘 듯한 순간, 모든 것이 고요해진 산책로 위에서 바라본 뷰는 환상적이었다.",
            "마법의 문이 열리고 그 안에는 놀라운 모험이 펼쳐져 있었다."
        ]
    
    var tasks: [TaskModel] = []
    for i in 0..<5 {
        tasks.append(TaskModel(task: title[i], description: descriptions[i]))
    }
    
    return tasks
}
