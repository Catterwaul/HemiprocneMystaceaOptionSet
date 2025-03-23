import Tuplé

public extension OptionSet where RawValue: BinaryInteger {
  /// Two options corresponding to sequential bit "flags".
  /// - Parameter startingFlagIndex: The amount the flags are left-shifted.
  /// - Returns: `0b11 << startingFlagIndex`
  static subscript(startingFlagIndex startingFlagIndex: RawValue = 0) -> Vectuple2<Self> {
    Self[
      startingFlagIndex: startingFlagIndex,
      shape: Vectuple2<Never>.self
    ]
  }

  /// Three options corresponding to sequential bit "flags".
  /// - Parameter startingFlagIndex: The amount the flags are left-shifted.
  /// - Returns: `0b111 << startingFlagIndex`
  static subscript(startingFlagIndex startingFlagIndex: RawValue = 0) -> Vectuple3<Self> {
    Self[
      startingFlagIndex: startingFlagIndex,
      shape: Vectuple3<Never>.self
    ]
  }

  /// Four options corresponding to sequential bit "flags".
  /// - Parameter startingFlagIndex: The amount the flags are left-shifted.
  /// - Returns: `0b1111 << startingFlagIndex`
  static subscript(startingFlagIndex startingFlagIndex: RawValue = 0) -> Vectuple4<Self> {
    Self[
      startingFlagIndex: startingFlagIndex,
      shape: Vectuple4<Never>.self
    ]
  }

  /// Five options corresponding to sequential bit "flags".
  /// - Parameter startingFlagIndex: The amount the flags are left-shifted.
  /// - Returns: `0b1_1111 << startingFlagIndex`
  static subscript(startingFlagIndex startingFlagIndex: RawValue = 0) -> Vectuple5<Self> {
    Self[
      startingFlagIndex: startingFlagIndex,
      shape: Vectuple5<Never>.self
    ]
  }

  /// Six options corresponding to sequential bit "flags".
  /// - Parameter startingFlagIndex: The amount the flags are left-shifted.
  /// - Returns: `0b11_1111 << startingFlagIndex`
  static subscript(startingFlagIndex startingFlagIndex: RawValue = 0) -> Vectuple6<Self> {
    Self[
      startingFlagIndex: startingFlagIndex,
      shape: Vectuple6<Never>.self
    ]
  }

  /// An option corresponding to a single bit "flag".
  /// - Parameter flagIndex: The amount the flag is left-shifted.
  init(flagIndex: RawValue) {
    self.init(rawValue: 1 << flagIndex)
  }
}

// MARK: - private
private extension OptionSet where RawValue: BinaryInteger {
  /// Options corresponding to sequential bit "flags".
  /// - Parameter startingFlagIndex: The amount the flags are left-shifted.
  /// - Returns: A group of binary `1`s.
  private static subscript<each Flag>(
    startingFlagIndex startingFlagIndex: RawValue = 0,
    shape shape: (repeat each Flag).Type = (repeat Each<Never, each Flag>).self,
  ) -> (repeat Each<Self, each Flag>) {
    let flag: (repeat Each<RawValue, each Flag>)
      = RawValue.stride(from: startingFlagIndex, by: 1, shape: shape)
    return (repeat .init(flagIndex: each flag))
  }
}
