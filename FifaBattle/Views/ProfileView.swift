//
//  ProfileView.swift
//  FifaBattle
//
//  Created by Sharma McGavin on 16/02/2023.
//

import SwiftUI



struct ProfileView: View {
    var profile: Profile
    
    var body: some View {
        VStack {
            if let profileImage = profile.profileImage {
                Image(uiImage: profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .padding(.bottom, 20)
            }
            
            Text("Name: \(profile.name)\nUsername: \(profile.username)\nFavorite Team: \(profile.favoriteTeam)\nFavorite Player: \(profile.favoritePlayer)")
                .padding(.bottom, 20)
                .multilineTextAlignment(.center)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let myProfile = Profile(name: "John Doe", username: "johndoe", favoriteTeam: "Manchester United", favoritePlayer: "Cristiano Ronaldo", profileImage: UIImage(named: "profile_pic"))
        ProfileView(profile: myProfile)
    }
}

