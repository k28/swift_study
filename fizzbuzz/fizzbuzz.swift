
for i in 1...100 {
    if i.isMultiple(of: 15) {
        print("FizzBuzz")
    } else if i.isMultiple(of: 3) {
        print("Fizz")
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(i)
    }
}

/*
    メモ: Swift 5.0からisMultipleでが使えるようになった
          (i % 3 == 0 の代わりに使える)
*/

