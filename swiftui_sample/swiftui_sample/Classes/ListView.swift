//
//  ListView.swift
//  swiftui_sample
//
//  Created by K.Hatano on 2020/02/21.
//  Copyright © 2020 Kazuya. All rights reserved.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var todoData: TodoData
//    let todos = [Todo(), Todo()]  // => 固定データで表示する場合はこれ
    // これにnilでない値が代入されると代入された値を元に編集画面を構築する
    @State var editing: Todo?
    
    var body: some View {
        List(todoData.todos) { todo in  // EnvironmentObject 経由でデータを表示する
//      List(todos) { todo in       // => 固定データで表示する場合はこれ
            // TodoCard(todo: todo) // -> カードを表示するだけのパターン
            Button(action:{ self.editing = todo }) {
                TodoCard(todo:todo)
            }
        }
        .navigationBarTitle("Todoリスト")
        .navigationBarItems(trailing:
            Button(action: { self.editing = Todo() }) {
                Text("追加")
                Image(systemName: "plus.circle")
            }
        )
            .sheet(item: $editing) { todo in
                DetailView(todo: todo, onSave: { todo in
                    // 保存処理を作成
                    self.todoData.store(todo: todo)
                })
        }
    }
}
