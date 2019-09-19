//
//  OptionalType.swift
//  
//
//  Created by Nikolay Fiantsev on 17/09/2019.
//

import Foundation

public protocol OptionalType {
  associatedtype Wrapped
  var value: Wrapped? { get }
}

extension Optional: OptionalType {
  public var value: Wrapped? {
    return self
  }
}
