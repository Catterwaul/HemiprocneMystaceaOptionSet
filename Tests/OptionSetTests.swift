import HMOptionSet
import Testing
import Foundation

import Tuplé

struct OptionSetTypeTests {
  @Test func _2Flags() {
    let options: Options = [.option1, .option2]
    #expect(options.rawValue == 0b11)
  }

  @Test func _3Flags() {
    let options: Options = [
      .option3,
      .option4,
      .option5
    ]
    #expect(options.rawValue == 0b1_1100)
  }

  @Test func _4Flags() {
    let options: Options = [
      .option6,
      .option7,
      .option8,
      .option9
    ]
    #expect(options.rawValue == 0b1_1110_0000)
  }

  @Test func _5Flags() {
    let options: Options = [
      .option10,
      .option11,
      .option12,
      .option13,
      .option14
    ]
    #expect(options.rawValue == 0b11_1110_0000_0000)
  }

  @Test func _6Flags() {
    let options: Options = [
      .option15,
      .option16,
      .option17,
      .option18,
      .option19,
      .option20
    ]
    #expect(options.rawValue == 0b1111_1100_0000_0000_0000)
  }
}

private struct Options: OptionSet {
  init(rawValue: UInt) {
    self.rawValue = rawValue
  }

  let rawValue: UInt

  static let (option1, option2) = Self[]
  static let (
    option3,
    option4,
    option5
  ) = Self[startingFlagIndex: 2]
  static let (
    option6,
    option7,
    option8,
    option9
  ) = Self[startingFlagIndex: 5]
  static let (
    option10,
    option11,
    option12,
    option13,
    option14
  ) = Self[startingFlagIndex: 9]
  static let (
    option15,
    option16,
    option17,
    option18,
    option19,
    option20
  ) = Self[startingFlagIndex: 14]
}
