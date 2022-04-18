
import Foundation

/// AsyncAwait関連のユーティリティ
enum Util {}
extension Util {
    static public func wait(_ sec: UInt64) async throws {
        try await Task.sleep(nanoseconds: sec * 1_000_000_000)
    }
}

@main
struct AsyncAwaitSmaple {

    static func main() async {
        await asyncPrint("Count start")
        await asyncCount(5)
        await asyncPrint("Count end")
    }

    static func asyncPrint(_ str: String) async {
        print(str)
    }

    static func asyncCount(_ repeatCount: Int) async {
        for i in 0..<repeatCount {
            print("asyncCount : \(i)")
                try? await Util.wait(1)
        }
    }

}



