//
//  DiamondKataTests.swift
//  DiamondKataTests
//
//  Created by Oleksii Maidanyk on 17.10.2022.
//

import XCTest
@testable import DiamondKata

final class DiamondKataTests: XCTestCase {
  private let generator = DiamondGenerator()
  
  func textEmpty() {
    let diamond = generator.generate("")
    XCTAssert(diamond == [[]], "diamond should be empty")
  }
  
  func testSingleCharacter() {
    let diamond = generator.generate("A")
    
    XCTAssert(diamond.count == 1, "diamond should have one line")
    XCTAssert((diamond.first?.count ?? 0) == 1, "diamond should have one letter")
    XCTAssert(diamond.first?.contains("A") ?? false, "diamond should have 'A'")
  }
  
  func testTwoCharacters() {
    let diamond = generator.generate("AB")
    
    XCTAssert(diamond.count == 3, "diamond should have three lines")
    XCTAssert(diamond[0].count == 3, "diamond's first line should have three characters")
    XCTAssert(diamond[0].contains("A"), "diamond's first line should have 'A'")
    XCTAssert(diamond[0].first ?? "" != "A", "diamond's first line should not have 'A' at the beginnig")
    XCTAssert(diamond[0].last ?? "" != "A", "diamond's first line should not have 'A' at the end")
    XCTAssert(diamond[1].count == 3, "diamond's second line should have three characters")
    XCTAssert(diamond[1].first ?? "" == "B", "diamond's second line should have 'B' at the beginning")
    XCTAssert(diamond[1].last ?? "" == "B", "diamond's second line should have 'B' at the end")
    XCTAssert(diamond[2].count == 3, "diamond's last line should have three characters")
    XCTAssert(diamond[2].first ?? "" != "A", "diamond's last line should have 'A' at the beginning")
    XCTAssert(diamond[2].last ?? "" != "A", "diamond's last line should have 'A' at the end")
    XCTAssert(diamond[0].contains("A"), "diamond's last line should have 'A'")
  }
  
  func testNcharacters() {
    let seed = "ABCD"
    let diamond = generator.generate(seed)
    
    let expSize = seed.count*2 - 1
    XCTAssert(diamond.count == expSize,
              "actual number of lines (\(diamond.count)) doesn't match expected (\(expSize))")
    for (index, char) in seed.enumerated() {
      let symbol = String(char)
      let firstLineIdx = index
      let lastLineIdx = expSize - 1 - index
      let expSymbolCount = index == 0 ? 1 : 2
      let expLeftCharIdx = seed.count/2 + 1 - index
      let expRightCharIdx = seed.count/2 + index + 1
      
      // top line
      var charsCount = diamond[firstLineIdx].filter({ $0 == symbol }).count
      XCTAssert(charsCount == expSymbolCount,
                "actual number of characters (\(charsCount)) doesn't match expected (\(expSymbolCount))")
      
      var leftIdx: Int = diamond[firstLineIdx].firstIndex(of: symbol) ?? -1
      XCTAssert(leftIdx != -1, "expected symbol doesn't exist")
      XCTAssert(leftIdx == expLeftCharIdx,
                "actual left char's index (\(leftIdx)) doesn't match expected (\(expLeftCharIdx))")
      
      
      var rightIdx: Int = diamond[firstLineIdx].lastIndex(of: symbol) ?? -1
      XCTAssert(rightIdx != -1, "expected symbol doesn't exist")
      XCTAssert(rightIdx == expRightCharIdx,
                "actual right char's index (\(rightIdx)) doesn't match expected (\(expRightCharIdx))")
      
      // bottom line
      charsCount = diamond[lastLineIdx].filter({ $0 == symbol }).count
      XCTAssert(charsCount == expSymbolCount,
                "actual number of characters (\(charsCount)) doesn't match expected (\(expSymbolCount))")
      
      leftIdx = diamond[lastLineIdx].firstIndex(of: symbol) ?? -1
      XCTAssert(leftIdx != -1, "expected symbol doesn't exist")
      XCTAssert(leftIdx == expLeftCharIdx,
                "actual left char's index (\(leftIdx)) doesn't match expected (\(expLeftCharIdx))")
      
      rightIdx = diamond[lastLineIdx].lastIndex(of: symbol) ?? -1
      XCTAssert(rightIdx != -1, "expected symbol doesn't exist")
      XCTAssert(rightIdx == expRightCharIdx,
                "actual right char's index (\(rightIdx)) doesn't match expected (\(expRightCharIdx))")
      
    }
  }
  
}
