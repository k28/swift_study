// 空の配列を初期化
var emptylist = [String]()
var emptydict = [String:String]()
print(emptylist)
print(emptydict)

// 配列の初期化と追加
var fruitslist = ["apple", "orange", "melon"]
print(fruitslist)
fruitslist[1] = "green apple"
print(fruitslist)

// 配列を順番に処理
for (item) in fruitslist {
    print(item)
}

// 順番に並んだ配列を作成
let sequencelist = [Int](0..<5)
for i in sequencelist {
    print(i)
}

// 辞書の初期化
var occupations = [
    "Malcolm" : "Captain",
    "Kaylee"  : "Mechanic",
]
print(occupations)
occupations["Jayne"] = "Public Relations"
print(occupations)

// 辞書を順番に処理
for (key, value) in occupations {
    print("\(key) is \(value)")
}


