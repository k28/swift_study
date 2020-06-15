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

// 改行文字で分割する
var result = "Hello\r\nWorld\r".split(whereSeparator: \.isNewline)  // ["Hello", "World"]

