
import Foundation

for argument in CommandLine.arguments {
  if let streamReader = StreamReader(path: argument) {
    defer {
      streamReader.close()
    }

    while let line = streamReader.nextLine() {
      print(line)
    }
  }
}

