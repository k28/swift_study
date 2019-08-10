
// 関数宣言はfuncから始まる。戻り値は -> の後に記載
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}

// call する時にはラベルの記載は必須
// 関数宣言の際に、_を書いておくと呼び出す時にラベルを省略できる
print(greet(person:"Alice", day:"Monday"))

// 関数はタプルを返すことも可能
func calclateStatistics(scores: [Int]) -> (min:Int, max:Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if min > score {
            min = score
        } else if max < score {
            max = score
        }
        sum += score
    }

    return (min, max, sum)
}

let statistics = calclateStatistics(scores: [5, 7, 13, 2, 17])
print(statistics.max)
print(statistics.2)

// 関数はfirst-classタイプなので、関数が関数を返すことも可能
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
print(increment(7))

// 引数として関数を受けることも可能
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
print(hasAnyMatches(list:numbers, condition: lessThanTen))
// true

// 関数はclosureの特別ケースでもある
let tmpNumbers = numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
print(tmpNumbers)

// Closureのタイプなどが決まっている場合は簡潔に書くことも可能
let mappedNumbers = numbers.map({number in 3 * number})
print(mappedNumbers)

