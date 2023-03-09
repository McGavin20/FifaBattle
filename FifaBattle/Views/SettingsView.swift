//
//  ProfileFormView.swift
//  FifaBattle
//
//  Created by Sharma McGavin on 16/02/2023.
//

import SwiftUI


struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var birthdate = Date()
    @State private var premierLeagueTeams: Double = 0
    @State private var profileImage: UIImage?
    @State private var profile: Profile?
    @State private var isShowingImagePicker = false
    @State private var selectedCountryIndex: Double = 0
    
    
    
    let favoriteTeam = ["Arsenal", "Aston Villa", "Brentford", "Brighton & Hove Albion", "Burnley", "Chelsea", "Crystal Palace", "Everton", "Leeds United", "Leicester City", "Liverpool", "Manchester City", "Manchester United", "Newcastle United", "Norwich City", "Southampton", "Tottenham Hotspur", "Watford", "West Ham United", "Wolverhampton Wanderers"]
    
    let countries = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua &amp; Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"]
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                VStack {
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
                                dismiss()
                                print("Settings saved")
                            }) {
                                Text("Save")
                                    .foregroundColor(.theme.primaryColor)
                            }
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
                        }
                        .foregroundColor(.theme.primaryColor)
                        
                        Spacer()
                        
                        Section(header: Text("Football Information")) {
                            Picker("Select your favorite team", selection: $premierLeagueTeams) {
                                ForEach(0..<favoriteTeam.count) { index in
                                    Text(favoriteTeam[index]).tag(index)
                                }
                                
                            }
                        }
                        .foregroundColor(.theme.primaryColor)
                        
                        Spacer()
                        
                        Section(header: Text("Bio")) {
                            TextField("Write about yourself", text: .constant(""))
                        }
                        .foregroundColor(.theme.primaryColor)
                    }
                }
            }
        }
        .environment(\.colorScheme, .dark)
    }
    
    struct Profile {
        var name: String
        var username: String
        var birthdate: Date
        var premierLeagueTeams: Double
        var profileImage: UIImage?
        var selectedCountryIndex: Double
    }
    
    func saveProfile(_ profile: Profile) {
        // Call a function to save the profile information to app's data store or service
        print("Profile sent to Database✅")
    }
    
//    struct ProfileFormView_Previews: PreviewProvider {
//        static var previews: some View {
//            SettingsView(table: table)
//        }
//    }
}

