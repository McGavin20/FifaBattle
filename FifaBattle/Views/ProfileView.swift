//
//  ProfileView.swift
//  FifaBattle
//
//  Created by Sharma McGavin on 16/02/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel: HomeViewModel = .init()
    @AppStorage("isLogged") var isLoggedIn: Bool = true
    
    var body : some View{
        NavigationView {
            
            ZStack{
                
                Color.black
                    .edgesIgnoringSafeArea(.all)
                Image("sign-in-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    .foregroundColor(.theme.primaryColor)
                    .offset(y: -150)
                
                VStack{
                    
                    HStack{
                        
                        NavigationLink(destination: SettingsView()) {
                            Text("Edit")
                                .foregroundColor(.theme.primaryColor)
                        }
                        
                        
                        Spacer()
                        
                        Button(action: {
                            signOut()
                        }) {
                            Text("Log Out")
                                .foregroundColor(.theme.primaryColor)
                        }
                    }
                    
                    Spacer()
                    
                    ZStack(alignment: .top) {
                        
                        VStack{
                            
                            HStack{
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    
                                    Text("Andro").font(.title).bold().foregroundColor(.theme.primaryColor)
                                    
                                    Text("25").foregroundColor(.theme.darkGray)
                                }
                                
                                Spacer()
                                
                                HStack(spacing: 8){
                                    
                                    Image("location").resizable().frame(width: 15, height: 20)
                                    
                                    Text("USA").foregroundColor(.theme.darkGray)
                                    
                                }.padding(8)
                                    .background(Color.black.opacity(0.1))
                                    .cornerRadius(10)
                            }.padding(.top,35)
                            
                            Text("Hi! My name is Bella. I live in Mbare. I love gaming and music. I like sharing my earned trophies. I see the world in different a way and I'm always positive.").padding(.top).foregroundColor(.theme.darkGray)
                            
                        }.padding()
                            .background(Blurview())
                            .clipShape(BottomShape())
                            .cornerRadius(25)
                            .offset(y: -67)
                        
                        ZStack{
                            
                            NavigationLink(destination: IncrementNumberButton()) {
                                Image("controller").renderingMode(.original).resizable()
                                    .frame(width: 40, height: 40)
                                    .padding(20)
                                    .background(Color.theme.lightGray)
                                    .clipShape(Circle())
                            }
                            
                            Circle().stroke(Color.theme.darkGray, lineWidth: 5).frame(width: 70, height: 70)
                            
                        }.offset(y: -100)
                            .padding(.horizontal,35)
                    }
                    
                }.padding()
            }
        }
    }
    private func signOut() {
        do {
            try viewModel.signOut()
            isLoggedIn.toggle()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

struct BottomShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addArc(center: CGPoint(x: rect.width / 2, y: 0), radius: 42, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)
            
        }
    }
}

struct Blurview : UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<Blurview>) -> UIVisualEffectView {
        
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialLight))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Blurview>) {
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

