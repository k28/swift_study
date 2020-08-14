import Foundation

// 特定の文字の場所で分割した部分文字列を取得する
let word = "123e456"
if let pos = word.firstIndex(of: "e") {
  // Indexを使った文字列取得はRangeになるので[]で部分文字列を取得できる
  _ = word[word.startIndex..<pos] // 123
  _ = word[word.startIndex...pos] // 123e
  _ = word[pos...]  // e456
  // String.index(after:)でIndexのIndexを取得できる
  _ = word[word.index(after: pos)...] // 456
}

// 文字で分割する
_ = word.split(separator: "e")  // ["123", "456"]

// 改行文字で分割する Swift5.2以降
var result = "Hello\r\nWorld\r".split(whereSeparator: \.isNewline)  // ["Hello", "World"]

// 最後の文字を取得する
_ = word.last!   // Charactorが取得できる, StringにするにはString()で囲む

// Swift 5.0からの新機能
// ##で囲むとrawStringになる => "をエスケープしなくて良い
repeat {
    let someNumber = 123
    let rawStr = #"Hello "New" World! \#(someNumber)"#
    print(rawStr)

    // ##"hoge#hoge"## のように##で始めると#も文字列中で使える
    let rawStr2 = ##"Use # inside """##
    print(rawStr2)
} while (false)

