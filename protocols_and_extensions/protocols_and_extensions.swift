
// protocolキーワードでプロトコルを定義する
// プロトコルを継承したクラスはプロトコルを実装していないとコンパイル時にエラーになる
protocol ExampleProtocol {
    var simpleDescription: String { get }
    // struct, enumで自身の値を変更する場合は
    // mutatingキーワードが必要
    // classの場合は不要
    mutating func adjust()
}

// Class, enumeration, structは全てプロトコルを継承できる
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 1123
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
print(a.simpleDescription)

struct SimpleStrucure: ExampleProtocol {
    var simpleDescription: String = "A simple structure."
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var b = SimpleStrucure()
b.adjust()
print(b.simpleDescription)

// 既存の定数型にもプロトコルを適応して拡張することができる
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 7
    }
}

print(7.simpleDescription)
var hoge = 7;
hoge.adjust()
print(hoge)

// プロトコルを用いることで複数の違うタイプを
// 同じ方法で扱うことが可能になる
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)

