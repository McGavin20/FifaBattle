//
//  SignUpView.swift
//  FifaBattle
//
//  Created by Sharma on 01/02/2023.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentation
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordAgain: String = ""
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                
                // Background Color
                Color.black
                    .ignoresSafeArea(edges: .all)
                
                // Main View
                VStack {
                    Text("Create new account")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .bold()
                    
                    // Fields
                    VStack(spacing: 20) {
                        TextField("Email", text: $email, prompt: Text("Enter email..."))
                            .font(.title2)
                            .textFieldStyle(.roundedBorder)
                            .autocapitalization(.none)
                            
                        
                        SecureField("Password", text: $password, prompt: Text("Enter password..."))
                            .font(.title2)
                            .textFieldStyle(.roundedBorder)
                            
                        
                        SecureField("Password", text: $passwordAgain, prompt: Text("Enter password again..."))
                            .font(.title2)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding()
                    .padding(.bottom, 8.0)
                    
                    // Bottom screen Buttons
                    VStack(spacing: 16) {
                        
                        // Create Account
                        Button {
                            createNewUser()
                        } label: {
                            Text("Create Account")
                                .frame(maxWidth: .infinity)
                                .font(.title2)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.theme.primaryColor)
                        .cornerRadius(16)
                        
                    }
                    .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: ContentView()) {
                        Text("Already have an account? Login")
                            .frame(maxWidth: .infinity)
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    private func createNewUser() {
        //Check that passwords match
        if password != passwordAgain { return }
        
        //Check Password is not empty
        if password.isEmpty { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            //
            if let err = error {
                print("Error: \(err.localizedDescription)")
                return
            }
            print("Successfully registered user.")
            
            //Bring user back to login
            presentation.wrappedValue.dismiss()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
