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
  Better Apps ♡ Less Code
  """)
        .font(.footnote)
        .multilineTextAlignment(.center)
        .foregroundColor(.gray)
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
