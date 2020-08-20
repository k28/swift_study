import Foundation

// 辞書の中の深い部分を書き換える方法

typealias DeepHash = [String: [String: [String]]]

func changeDeepHash(_ dict: inout DeepHash) {
    // Apple のcountを["100", "200", "300"]に変えたい

    // 上から順に更新したものでアップデートしていく
    // if var apple = dict["Apple"] {
    //     if var count = apple["count"] {
    //         count.append("300")
    //         apple["count"] = count
    //     }
    //     dict["Apple"] = apple
    // }

    // 追加したい場所が決まっているなら以下の方法でもValueをアップデートできる
    // if dict["Apple"]?["count"] != nil {
    //     dict["Apple"]!["count"]!.append("300")
    // }
}

let original: DeepHash = [
    "Apple":  ["color": ["red", "green"],    "count": ["100", "200"]],
    "Orange": ["color": ["orange", "green"], "count": ["10", "20"]]
    ]

print(original)
var copy = original
changeDeepHash(&copy)

print(original)
print(copy)
