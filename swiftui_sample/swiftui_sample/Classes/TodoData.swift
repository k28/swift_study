//
//  TodoData.swift
//  swiftui_sample
//
//  Created by K.Hatano on 2020/02/25.
//  Copyright © 2020 Kazuya. All rights reserved.
//

import Foundation

class TodoData: ObservableObject {
    // 更新通知のしたいプロパティに@Publishedを付与する
    // これが付与されたプロパティに変化があった時にObservableObjectは自身が変更されたとみなして更新を通知する
    @Published var todos: [Todo] = []
    
    func store(todo: Todo) {
        if let index = todos.firstIndex(where: {
            $0.id == todo.id
        }) {
            todos[index] = todo
        } else {
            todos.insert(todo, at: 0)
        }
    }
}
