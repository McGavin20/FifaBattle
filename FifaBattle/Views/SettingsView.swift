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
    @State private var selectedCountryIndex = 0
    let countries = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua &amp; Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"]
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack{
                        
                        Button(action: {
                            //Saved Info
                            presentationMode.wrappedValue.dismiss()
                            print("Settings dismissed")
                            
                        }) {
                            Text("Cancel")
                                .foregroundColor(.theme.primaryColor)
                        }
                        
                        
                        Spacer()
                        
                        Button(action: {
                            //Saved Info
                            print("Settings saved")
                        }) {
                            Text("Save")
                                .foregroundColor(.theme.primaryColor)
                        }
                    }
                    
                        Form {
                            Section(header: Text("Personal Information")) {
                                TextField("Name", text: $name)
                                TextField("Username", text: $username)
                                Picker("Select your country", selection: $selectedCountryIndex) {
                                    ForEach(0..<countries.count) { index in
                                        Text(countries[index]).tag(index)
                                    }
                                }
                                DatePicker("Date of Birth", selection: $birthdate, displayedComponents: .date)
                                    .foregroundColor(.theme.primaryColor)
                                
                                Spacer()
                                
                                Section(header: Text("Football Information")) {
                                    TextField("Favorite Team", text: $favoriteTeam)
                                    TextField("Favorite Player", text: $favoritePlayer)
                                }
                                .foregroundColor(.theme.primaryColor)
                                
                                Spacer()
                                
                                Section(header: Text("Bio")) {
                                    TextField("Write about yourself", text: .constant(""))
                                }
                            }
                            .foregroundColor(.theme.primaryColor)
                        }
                        
                    
                }
                
            }
            //.navigationBarTitle("Settings")
            .environment(\.colorScheme, .dark)
            
        }
        
    }
    struct Profile {
        var name: String
        var username: String
        var favoriteTeam: String
        var favoritePlayer: String
        var profileImage: UIImage?
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
    
    
    
    
    struct ProfileFormView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }
}

