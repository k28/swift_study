
// Enumeration
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "A"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        default:
            return String(self.rawValue)
        }
    }
}

enum Suit: Int {
    case club, dia, heart, spade
   
    func simpleDescription() -> String {
        switch self {
        case .club:
            return "Club"
        case .dia:
            return "Dia"
        case .heart:
            return "Heart"
        case .spade:
            return "Spade"
        }
    }
}

let ace = Rank.ace
print(ace.simpleDescription())
print(ace.rawValue)

// 値をストアするEnumも作成可能
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunset is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure... \(message)")
}

// 構造体 (Structure)
// 構造体はstructキーワードから始まる
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .three, suit: .spade)
print(threeOfSpades.simpleDescription())

