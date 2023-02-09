//
//  ResetPasswordView.swift
//  FifaBattle
//
//  Created by Sharma on 01/02/2023.
//

import SwiftUI
import FirebaseAuth

struct ResetPasswordView: View {
    
    // MARK: - Properties
    
    @State var email: String = ""
    @Environment(\.presentationMode) var presentation
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack {
                
                // Background Color
                Color.black
                    .ignoresSafeArea()
                
                
                // Main View
                VStack {
                    Text("Register Account")
                        .navigationBarTitleDisplayMode(.inline)
                        .font(.title)
                        .foregroundColor(Color.white)
                        .bold()
                    
                    
                    // Fields
                    VStack(spacing: 15) {
                        
                        TextField("Email", text: $email, prompt: Text("Enter email..."))
                            .font(.title2)
                            .textFieldStyle(.roundedBorder)
                            .autocapitalization(.none)
                            .frame(width: 340, height: 60)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                            .foregroundColor(.black)
                        
                    }
                    .padding()
                    .padding(.bottom, 8.0)
                    
                    // Buttons
                    VStack(spacing: 30) {
                        
                        // Create Account
                        Button {
                            resetPassword()
                            
                        } label: {
                            Text("Reset password")
                                .frame(maxWidth: .infinity)
                                .font(.title2)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(16)
                        NavigationLink(destination: ContentView()) {
                            HStack(spacing: 0) {
                                Text(Image(systemName: "arrow.left"))
                                    .foregroundColor(Color.gray)
                                Text("Back to login")
                                    .font(.headline)
                                    .foregroundColor(Color.gray)
                                    .padding()
                            }
                        }
                    }
                    .padding()
                    
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    private func resetPassword() {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let err = error {
                print ("Error: \(err.localizedDescription)")
                return
            }
            print("✅ Reset Password Sent")
            presentation.wrappedValue.dismiss()
        }
    }
}



struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
