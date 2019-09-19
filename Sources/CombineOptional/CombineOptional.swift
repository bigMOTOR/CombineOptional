//
//  CombineOptional.swift
//
//
//  Created by Nikolay Fiantsev on 17/09/2019.
//

import Foundation
import Combine

public extension Publisher where Self.Output: OptionalType {
  func filterNil() -> AnyPublisher<Self.Output.Wrapped, Self.Failure> {
    return self.flatMap { element -> AnyPublisher<Self.Output.Wrapped, Self.Failure> in
      guard
        let value = element.value
        else { return Empty(completeImmediately: false).setFailureType(to: Self.Failure.self).eraseToAnyPublisher() }
      return Just(value).setFailureType(to: Self.Failure.self).eraseToAnyPublisher()
    }.eraseToAnyPublisher()
  }
}
