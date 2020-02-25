//
//  ContentView.swift
//  swiftui_sample
//
//  Created by K.Hatano on 2020/02/21.
//  Copyright © 2020 Kazuya. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ListView()
            .environmentObject(TodoData())  // ListViewにTodoDataを与える
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
