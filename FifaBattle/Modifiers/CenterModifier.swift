//
//  CenterModifier.swift
//  FifaBattle
//
//  Created by Sharma McGavin on 24/02/2023.
//

import Foundation
import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
