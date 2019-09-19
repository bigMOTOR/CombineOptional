import XCTest
import Combine
@testable import CombineOptional

final class CombineOptionalTests: XCTestCase {
  
  func testFilterNil() {
    let testData = [1, nil, 2]
    let testPublisher = PassthroughSubject<Int?, Error>()
    
    var receivedValuesFilterNil = [Int?]()
    
    let cancellable = testPublisher
      .eraseToAnyPublisher()
      .filterNil()
      .sink(
        receiveCompletion: { _ in  },
        receiveValue: { receivedValuesFilterNil.append($0) }
      )
    
    testData.forEach {
      testPublisher.send($0)
    }
    
    XCTAssertEqual(receivedValuesFilterNil.count, 2)
    XCTAssertFalse(receivedValuesFilterNil.contains(nil))
    XCTAssertNotNil(cancellable)
  }
  
  static var allTests = [
    ("testFilterNil", testFilterNil),
  ]
}
