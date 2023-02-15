//
//  IncrementNumberButton.swift
//  FifaBattle
//
//  Created by Sharma McGavin on 15/02/2023.
//

import SwiftUI

struct IncrementNumberButton: View {
    @State private var number = 0
    
    var body: some View {
        NavigationView {
            //        ZStack {
            //            Color.black
            //                .ignoresSafeArea()
            VStack {
                Text("You:")
                HStack {
                    Button(action: {
                        number -= 1
                    }, label: {
                        Image(systemName: "minus.circle")
                            .foregroundColor(.red)
                    })
                    Text("\(number)")
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                    Button(action: {
                        number += 1
                    }, label: {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.green)
                    })
                }
                Spacer()
                Text("Opponent:")
                HStack {
                    Button(action: {
                        number += 1
                    }, label: {
                        Image(systemName: "minus.circle")
                            .foregroundColor(.red)
                    })
                    Text("\(number)")
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                    Button(action: {
                        number -= 1
                    }, label: {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.green)
                    })
                }
                Spacer()
                NavigationLink(destination: HomeView()) {
                    Text("Confirm")
                }
            }
        }
    }
}
//}

struct IncrementNumberButton_Previews: PreviewProvider {
    static var previews: some View {
        IncrementNumberButton()
    }
}
