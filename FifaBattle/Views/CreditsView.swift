//
//  CreditsView.swift
//  FifaBattle
//
//  Created by Sharma McGavin on 24/02/2023.
//

import SwiftUI

struct CreditsView: View {
  var body: some View {
      VStack {
      Image("logo")
        .resizable()
        .scaledToFit()
        .frame(width: 128, height: 128)
      Text("""
  Copyright © Sharma Muridzo
  All right reserved
  ♡ The distance between reality & your dream
  may be just a few hundred lines of code. ♡
  """)
        .font(.footnote)
        .multilineTextAlignment(.center)
        .foregroundColor(.theme.whiteGray)
    } //: VSTACK
    .padding()
    //.opacity(0.4)
  }
}

struct CreditsView_Previews: PreviewProvider {
  static var previews: some View {
    CreditsView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}

