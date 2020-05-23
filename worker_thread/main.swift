
import Foundation


// Concurrent (並列処理)
let concurrentQueue = DispatchQueue(label:"Concurrent" , qos: .default, attributes: .concurrent)

// Serially   (直列処理)
let serialQueue = DispatchQueue(label:"Serial" , qos: .default)

for i in 0..<10 {
    concurrentQueue.async {
        print("Concurrent \(i)")
    }

    serialQueue.async {
        // print("Serial     \(i)")
    }
}

