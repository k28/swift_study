
// if文 letと組み合わせるとnilチェックができる
var mountain: String? = "Norikura"
if let name = mountain {
    print("Mountan name is \(name)")
}

// ..< だと最後の数値は入らない、入れるには ... にする
// 配列や辞書の中身に対して処理する場合もforを使う
for i in 1 ..< 10 {
    print(i)
}

for i in 1 ... 10 {
    print(i)
}

// switch case
// 文字に対しても使える
// defaultは必須
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumner", "watercress":
    print("That would make a good tea sandwitch")
case let x where x.hasSuffix("pepper"):
    print("Is is a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

// while
var n = 2
while n < 100 {
    n *= 2
}
print(n)
// 128

// repeat - while
var m = 3
repeat {
    m *= 2;
} while m < 100
print(m)
// 192

var l = 4
repeat {
    if l < 5 {
        break
    }

    l += 5
} while false
print(l)
// 4

