
// <>の中に名前を書くことでgenericsを使用可能
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

print(makeArray(repeating:"Hello", numberOfTimes:3))

// 関数、enum, structureでもgenericsが使える
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)


// Elementに制約がある場合は以下のように記述可能
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) ->
    Bool 
        where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }

    return false
}

print(anyCommonElements([1, 2, 3], [3]))
// print(anyCommonElements([1, 2, 3], ["3"])) エラーになる

