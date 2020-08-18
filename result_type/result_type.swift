import Foundation

enum ActionError: Error {
    case notAllow
}

func sampleHttpRequest(type: Int, completionHandler: @escaping (Result<Int, ActionError>) -> Void) {
    if type == 0 {
        completionHandler(.failure(.notAllow))
        return
    }

    // some action
    completionHandler(.success(7))
}

sampleHttpRequest(type: 0) { result in
    switch result {
    case .success(let val):
        print("action result: \(val)")
    case .failure(let error):
        print(error.localizedDescription)
    }
}


