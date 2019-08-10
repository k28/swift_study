
// クラス定義
class Shape {
    var numberOfSides = 0
    var name: String

    // initializer
    init (name: String) {
        self.name = name
    }

    // deinit デストラクタ

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides (\(name))."
    }
}

var shape = Shape(name:"7derection")
shape.numberOfSides = 7
print(shape.simpleDescription())

// サブクラスの作成
// サブクラスは:でスーパークラス名を記載する
class Square: Shape {
    var sideLength: Double

    init (sideLength: Double, name: String) {
        self.sideLength = sideLength
        // スーパークラスのイニシャライザをcall
        super.init(name: name)
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    // スーパークラスの関数をオーバーライドする時には、overrideキーワードが必須
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let testSquare = Square(sideLength: 5.2, name: "sample square")
print(testSquare.area())
print(testSquare.simpleDescription())

// セッターゲッターに処理を追加することができる (あまり多用はよくなさそうだけど)
class EquilateralTriangle: Shape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            // newValueで設定する値にアクセスできる
            sideLength = newValue / 3.0
        }
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

