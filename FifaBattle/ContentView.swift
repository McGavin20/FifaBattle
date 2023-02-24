//
//  ContentView.swift
//  FifaBattle
//
//  Created by Sharma on 01/02/2023.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var showSignUpView : Bool = false
    @State var showResetPasswordView : Bool = false
    @State var showHomeView : Bool = false
    @AppStorage("isLogged") var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack{
                //Links to other pages
                NavigationLink(destination: CustomTabView(), isActive: $isLoggedIn, label:{ EmptyView() })
                //Background Color
                Color.green
                    .ignoresSafeArea() 
                Circle()
                    .scale(1.7)
                    .foregroundColor(.black.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.black)
                
                VStack(spacing: 5) {
                    Image("sign-in-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .center)
//                    Text("Sign In")
//                        .foregroundColor(.white)
//                        .font(.largeTitle)
//                        .bold()
//                        .padding()
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat())
                    SecureField("Password", text: $password)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat())
                    Button("Sign In") {
                        //Authentication
                        signInUser()
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    
                    HStack {
                        NavigationLink(destination: ResetPasswordView()) {
                            Text("Reset your password?")
                        }
                        .font(.footnote)
                        .padding(.leading)
                        .foregroundColor(.gray)
                        Spacer()
                        NavigationLink(destination: SignUpView()) {
                            Text("Create Account")
                        }
                    }
                    
                    .font(.footnote)
                    .padding(.trailing)
                    .foregroundColor(.green)
                }
                
            }
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
    }
    private func signInUser() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            if let err = error {
                print ("Error: \(err.localizedDescription)")
                return
            }
//            self.showHomeView = true
            self.isLoggedIn = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
