//
//  HeaderView.swift
//  FifaBattle
//
//  Created by Sharma McGavin on 15/02/2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        NavigationView {
            Text("My View")
                .navigationBarItems(trailing:
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    Image(systemName: "plus")
                }
                )
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
