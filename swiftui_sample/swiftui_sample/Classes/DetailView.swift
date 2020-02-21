//
//  DetailView.swift
//  swiftui_sample
//
//  Created by K.Hatano on 2020/02/21.
//  Copyright © 2020 Kazuya. All rights reserved.
//

import SwiftUI

/// Todoの編集画面
struct DetailView: View {
    @State var todo: Todo       // 現在編集中のTodo
    var onSave:(Todo) -> ()     // 保存処理を実装するクロージャー
    
    func SectionTitle(_ title: String) -> some View {
        Text(title).font(.headline)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            SectionTitle("タイトル")
            TextField("やろうとしていること", text: $todo.title)
                .font(.title).padding()
            SectionTitle("期限")
            DatePicker("", selection: $todo.dueDate, displayedComponents: [.date])
            Spacer()
        }
        .padding()
        .onDisappear() {    // 画面を閉じるタイミングでCallされる
            self.onSave(self.todo)
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(todo: Todo(), onSave: { _ in })
    }
}
