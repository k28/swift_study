
// Errorプロトコルを継承してエラーを作成できる
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// エラーをthrowする関数はthrowsキーワードで定義する
func send(job: Int, toPrinter printerName:String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    if printerName == "On Fire" {
        throw PrinterError.onFire
    }

    return "Job sent"
}

do {
    // let printerResponse = try send(job: 400, toPrinter: "Bi Sheng")
    let printerResponse = try send(job: 400, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}

// エラー毎に処理を分けることも可能
do {
    // let printerResponse = try send(job: 1440, toPrinter: "Musashi")
    // let printerResponse = try send(job: 1440, toPrinter: "Never Has Toner")
    let printerResponse = try send(job: 1440, toPrinter: "On Fire")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError)")
} catch {
    print(error)
}

// try?でもエラーハンドリング可能
// この場合、Errorがthrowされるとnilになる
if let printerSuccess = try? send(job: 1884, toPrinter: "Fuji") {
    print(printerSuccess)
}

if let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner") {
    // ここは呼ばれない (printerfailureがnilになるので)
    print(printerFailure)
}

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    // deferキーワードを書くと必ず関数の最後に実行される
    // 最後のクリーンアップ処理を記述するのに使える
    defer {
        fridgeIsOpen = false
    }

    fridgeIsOpen = true
    let result = fridgeContent.contains(food)
    return result
}

let retVal = fridgeContains("banana")
print("retVal = \(retVal)")
print(fridgeIsOpen)

