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
  private var cancellableSet: Set<AnyCancellable> = []
}
