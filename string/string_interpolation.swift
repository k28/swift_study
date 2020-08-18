import Foundation

struct Animal {
    var kind: String
    var name: String
}

// 自作のクラスを文字列内で展開させる
extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Animal) {
        appendInterpolation("\(value.kind) name: \(value.name)")
    }
}

let dog = Animal(kind: "Dog", name: "Ein")
print("Animal: \(dog)")


// appendLiteral()を使えば文字を続けて追加可能
extension String.StringInterpolation {
    mutating func appendInterpolation(repeat str: String, _ count: Int) {
        for _ in 0 ..< count {
            appendLiteral(str)
        }
    }
} 

print("appendLiteral \(repeat: "Ein ", 3)")

// string interpolationを使えば、文字列からクラスを作成する事も可能
struct SampleComponent: ExpressibleByStringLiteral, ExpressibleByStringInterpolation, CustomStringConvertible {
    struct StringInterpolation: StringInterpolationProtocol {
        var output = ""

        init(literalCapacity: Int, interpolationCount: Int) {
            output.reserveCapacity(literalCapacity * 2)
        }

        mutating func appendLiteral(_ literal: String) {
            output.append(literal)
        }

        mutating func appendInterpolation(hello: String) {
            output.append("Hello = \(hello)")
        }

        mutating func appendInterpolation(thanks: String) {
            output.append("thanks = \(thanks)")
        }
    }

    let description: String
    
    init(stringLiteral value: String) {
        description = value
    }

    init(stringInterpolation: StringInterpolation) {
        description = stringInterpolation.output
    }
}

let sample: SampleComponent = "Interpolation sample \(hello: "こんにちは"), \(thanks: "ありがとう")." 
print(sample)

