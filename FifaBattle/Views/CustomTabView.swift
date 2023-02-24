//
//  TabView.swift
//  FifaBattle
//
//  Created by Sharma McGavin on 21/02/2023.
//

import SwiftUI

struct CustomTabView: View {
    @State var selected = 0
    @State var isHome: Bool = false
    @State var isScoreRecorded: Bool = false
    @State var isProfileRevealed: Bool = false
    @AppStorage("isLogged") var isLoggedIn: Bool = false
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            NavigationView{
                
                VStack{
                    if self.selected == 0{
                        TableView()
                    }
                    else if self.selected == 1{
                        IncrementNumberButton()
                    }
                    else if self.selected == 2{
                        ProfileView()
                    }
                    else{
                        GeometryReader{_ in
                            VStack(spacing: 15){
                                Spacer()
                                Text("Settings")
                                    .font(.title)
                                    .foregroundColor(.white)
                                Image("4").resizable().frame(height: 250).cornerRadius(15)
                                Spacer()
                            }.padding()
                        }
                    }
                    
                }
            }.background(Color.gray)
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
            FloatingTabbar(selected: self.$selected)
        }
    }
}


struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}

struct FloatingTabbar : View {
    
    @Binding var selected : Int
    @State var expand = false
    
    var body : some View{
        
        HStack{
            
            Spacer(minLength: 0)
            
            HStack{
                if !self.expand{
                    
                    Button(action: {
                        self.expand.toggle()
                    }) {
                        Image(systemName: "arrow.left").foregroundColor(.green).padding()
                    }
                }
                else{
                    Button(action: {
                        self.selected = 0
                    }) {
                        Image(systemName: "house").foregroundColor(self.selected == 0 ? .green : .gray).padding(.horizontal)
                    }
                    
                    Spacer(minLength: 15)
                    
                    Button(action: {
                        self.selected = 1
                    }) {
                        Image(systemName: "sportscourt").foregroundColor(self.selected == 1 ? .green : .gray).padding(.horizontal)
                    }
                    
                    Spacer(minLength: 15)
                    
                    Button(action: {
                        self.selected = 2
                    }) {
                        Image(systemName: "person").foregroundColor(self.selected == 2 ? .green : .gray).padding(.horizontal)
                    }
                    Spacer(minLength: 15)
                    
                    Button(action: {
                        self.selected = 3
                    }) {
                        Image(systemName: "gearshape").foregroundColor(self.selected == 3 ? .green : .gray).padding(.horizontal)
                    }
                }
            }.padding(.vertical,self.expand ? 20 : 8)
                .padding(.horizontal,self.expand ? 35 : 8)
                .background(Color.black)
                .clipShape(Capsule())
                .padding(22)
                .onLongPressGesture {
                    
                    self.expand.toggle()
                }
                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6))
        }
    }
}
