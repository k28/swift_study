//
//  TodoCard.swift
//  swiftui_sample
//
//  Created by K.Hatano on 2020/02/21.
//  Copyright © 2020 Kazuya. All rights reserved.
//

import SwiftUI

/// Todoを表示させるカード
struct TodoCard: View {
    var todo: Todo

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(todo.title)
                    .font(.title).fontWeight(.semibold)
                HStack {
                    Image(systemName: "clock")
                    Text(formatter.string(from: todo.dueDate))
                }
            }
            Spacer()
        }
        .padding().background(Color.white)
        .cornerRadius(6).shadow(radius: 3)
    }
}

private let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "M月d日"
    return formatter
}()

struct TodoCard_Previews: PreviewProvider {
    static var previews: some View {
        TodoCard(todo: Todo())
    }
}
