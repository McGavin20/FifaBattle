//
//  ProfileFormView.swift
//  FifaBattle
//
//  Created by Sharma McGavin on 16/02/2023.
//

import SwiftUI

struct ProfileFormView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var favoriteTeam: String = ""
    @State private var favoritePlayer: String = ""
    @State private var profileImage: UIImage?
    @State private var profile: Profile?
    @State private var isShowingImagePicker = false
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Form {
                    Section(header: Text("Personal Information")) {
                        TextField("Name", text: $name)
                        TextField("Username", text: $username)
                    }
                    .foregroundColor(.green)
                    
                    Section(header: Text("Football Information")) {
                        TextField("Favorite Team", text: $favoriteTeam)
                        TextField("Favorite Player", text: $favoritePlayer)
                    }
                    .foregroundColor(.green)
                    
                    Section(header: Text("Profile Picture")) {
                        Button(action: { self.isShowingImagePicker = true }) {
                            Text("Choose Photo")
                        }
                        .foregroundColor(.green)
                        if let profileImage = profileImage {
                            Image(uiImage: profileImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }
                .navigationBarTitle("Profile Form")
                .foregroundColor(.green)
                .navigationBarItems(
                    leading: Button("Cancel") {
                        // Handle cancel action
                    },
                    trailing: Button("Save") {
                        // Save profile information and dismiss form
                        self.profile = Profile(
                            name: name,
                            username: username,
                            favoriteTeam: favoriteTeam,
                            favoritePlayer: favoritePlayer,
                            profileImage: profileImage
                        )
                        // Call a function to save the profile information to your app's data store or service
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                )
                .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: self.$profileImage)
                }
                
            }
            .environment(\.colorScheme, .dark)
            .navigationViewStyle(StackNavigationViewStyle())
            .background(
                NavigationLink(
                    destination: ProfileView(profile: Profile(name: name, username: username, favoriteTeam: favoriteTeam, favoritePlayer: favoritePlayer, profileImage: profileImage)),
                    isActive: Binding<Bool>(
                        get: { self.profileImage != nil },
                        set: { if !$0 { self.profileImage = nil } }
                    )
                ) {
                    EmptyView()
                }
            )

        }
    }
    
    func loadImage() {
        guard let profileImage = profileImage else { return }
        let imageData = profileImage.jpegData(compressionQuality: 0.5)
        // Handle the loaded image data, e.g., display the image preview in the form view
    }
}

struct Profile {
    var name: String
    var username: String
    var favoriteTeam: String
    var favoritePlayer: String
    var profileImage: UIImage?
}


struct ProfileFormView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileFormView()
    }
}
