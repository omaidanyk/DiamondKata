//
//  DiamondGenerator.swift
//  DiamondKata
//
//  Created by Oleksii Maidanyk on 17.10.2022.
//

import Foundation

final class DiamondGenerator {
  var separator: String = "_"
  
  func generate(_ input: String) -> [[String]] {
    guard !input.isEmpty else { return [[]] }
    let size = input.count * 2 - 1
    var result = Array(repeating: Array(repeating: separator, count: size), count: size)
    
    for (index, element) in input.enumerated() {
      let leftIdx = input.count - 1 - index
      let rightIdx = input.count - 1 + index
      let bottomIdx = size - 1 - index
      
      result[index][leftIdx] = String(element)
      if leftIdx != rightIdx {
        result[index][rightIdx] = String(element)
      }
      
      if index != bottomIdx {
        result[bottomIdx][leftIdx] = String(element)
        if leftIdx != rightIdx {
          result[bottomIdx][rightIdx] = String(element)
        }
      }
    }
    return result
  }
}
