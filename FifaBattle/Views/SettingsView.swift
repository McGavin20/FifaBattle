//
//  ProfileFormView.swift
//  FifaBattle
//
//  Created by Sharma McGavin on 16/02/2023.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var birthdate = Date()
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
                        DatePicker("Date of Birth", selection: $birthdate, displayedComponents: .date)
                        
                    }
                    .foregroundColor(.theme.primaryColor)
                    
                    Section(header: Text("Football Information")) {
                        TextField("Favorite Team", text: $favoriteTeam)
                        TextField("Favorite Player", text: $favoritePlayer)
                    }
                    .foregroundColor(.theme.primaryColor)
                    
                    Section(header: Text("Profile Picture")) {
                        if profileImage != nil {
                            Button(action: { self.isShowingImagePicker = true }) {
                                Image(uiImage: profileImage!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        } else {
                            Button(action: { self.isShowingImagePicker = true }) {
                                Text("Choose Photo")
                            }
                        }
                    }
                    
                }
                
                .foregroundColor(.theme.primaryColor)
                .navigationBarItems(
                    leading: Button("Cancel") {
                        // Handle cancel action
                        
                    }.foregroundColor(.theme.lightGray),
                    trailing: Button("Save") {
                        // Save profile information and dismiss form
                        self.profile = Profile(
                            name: name,
                            username: username,
                            favoriteTeam: favoriteTeam,
                            favoritePlayer: favoritePlayer,
                            profileImage: profileImage
                        )
                        saveProfile(self.profile!)
                        presentationMode.wrappedValue.dismiss()
                    }
                        .foregroundColor(.theme.lightGray)
                )
                .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: self.$profileImage)
                }
                
            }
            .navigationBarTitle("Settings")
            .environment(\.colorScheme, .dark)
        }
        
    }
    func saveProfile(_ profile: Profile) {
        // Call a function to save the profile information to app's data store or service
        print("Profile sent to Database✅")
    }
    
    func loadImage() {
        guard let profileImage = profileImage else { return }
        guard let imageData = profileImage.jpegData(compressionQuality: 0.5) else {
            print("Error: could not convert image to JPEG data")
            return
            // Handle the loaded image data, e.g., display the image preview in the form view
            self.profile = Profile(
                name: name,
                username: username,
                favoriteTeam: favoriteTeam,
                favoritePlayer: favoritePlayer,
                profileImage: UIImage()
            )
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
            SettingsView()
        }
    }
}
