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
      Spacer()
      Text(viewModel.output)
        .padding(40)
        .font(.system(size: 500))
        .minimumScaleFactor(0.01)
      Spacer()
      HStack {
        Text("Use Underscore:")
        Spacer()
        Toggle("", isOn: $viewModel.useUndescore)
      }
      TextField("Seed", text: $viewModel.input)
    }
    .padding()
  }
}

struct DiamondView_Previews: PreviewProvider {
  static var previews: some View {
    DiamondView(viewModel: DiamondViewModel())
  }
}
