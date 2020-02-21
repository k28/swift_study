//
//  ListView.swift
//  swiftui_sample
//
//  Created by K.Hatano on 2020/02/21.
//  Copyright © 2020 Kazuya. All rights reserved.
//

import SwiftUI

struct ListView: View {
    let todos = [Todo(), Todo()]
    // これにnilでない値が代入されると代入された値を元に編集画面を構築する
    @State var editing: Todo?
    
    var body: some View {
        List(todos) { todo in
            // TodoCard(todo: todo) // -> カードを表示するだけのパターン
            Button(action:{ self.editing = todo }) {
                TodoCard(todo:todo)
            }
        }
        .navigationBarItems(trailing: Button("追加") {
            self.editing = Todo()
        })
            .sheet(item: $editing) { todo in
                DetailView(todo: todo, onSave: { _ in
                    // TODO 保存処理を作成
                })
        }
    }
}
