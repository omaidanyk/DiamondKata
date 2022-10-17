//
//  DiamondView.swift
//  DiamondKata
//
//  Created by Oleksii Maidanyk on 17.10.2022.
//

import Combine
import SwiftUI

struct DiamondView: View {
  @ObservedObject var viewModel: DiamondViewModel
  
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text("Hello, world!")
    }
    .padding()
  }
}

struct DiamondView_Previews: PreviewProvider {
  static var previews: some View {
    DiamondView(viewModel: DiamondViewModel())
  }
}
