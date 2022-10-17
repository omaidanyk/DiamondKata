//
//  DiamondViewModel.swift
//  DiamondKata
//
//  Created by Oleksii Maidanyk on 17.10.2022.
//

import Combine

final class DiamondViewModel: ObservableObject {
  @Published var output: String = ""
  @Published var input: String = ""
  @Published var useUndescore: Bool = false
  private var cancellableSet: Set<AnyCancellable> = []
  private let generator = DiamondGenerator()
  
  init() {
    generator.separator = " "
    setupPublishers()
  }
  
  private func setupPublishers() {
    $input.dropFirst().sink { [weak self] newValue in
      guard let self = self else { return }
      let diamond = self.generator.generate(newValue)
      self.output = self.format(diamond)
    }.store(in: &cancellableSet)
    
    $useUndescore.dropFirst().sink { [weak self] newValue in
      guard let self = self else { return }
      let newSeparator = newValue ? "_" : " "
      self.output = self.output.replacingOccurrences(of: self.generator.separator,
                                                     with: newSeparator)
      self.generator.separator = newSeparator
    }.store(in: &cancellableSet)
  }
  
  private func format(_ diamond: [[String]]?) -> String {
    guard let diamond = diamond else { return "" }
    return diamond.map({ $0.joined() + "\n" }).joined()
  }
}
