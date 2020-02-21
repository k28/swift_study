//
//  ToDo.swift
//  swiftui_sample
//
//  Created by K.Hatano on 2020/02/21.
//  Copyright © 2020 Kazuya. All rights reserved.
//

import Foundation

/// リストに表示するデータモデル
struct Todo: Identifiable {
    var id = UUID()     // Identifiableに適応するためにidを定義する
    var title: String = "タイトル"
    var dueDate: Date = Date()
}
