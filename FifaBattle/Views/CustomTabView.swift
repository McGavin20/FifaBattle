//
//  TabView.swift
//  FifaBattle
//
//  Created by Sharma McGavin on 21/02/2023.
//

import SwiftUI

enum  Tab: String, CaseIterable {
    case house
    case sportscourt
    case person
    case gearshape
}

struct CustomTabView: View {
    @Binding var selectedTab: Tab
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView {
                // View to navigate to
                //TableView()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("House")
            }
            .tag(Tab.house)

            
            NavigationView {
                IncrementNumberButton()
            }
            .tabItem {
                Image(systemName: "sportscourt.fill")
                Text("Sports Court")
            }
            .tag(Tab.sportscourt)
            
            
            NavigationView {
                ProfileFormView()
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("Person")
            }
            .tag(Tab.person)
            
            Text("Gear Shape View")
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Gear Shape")
                }
                .tag(Tab.gearshape)
        }
        
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage :
                            tab.rawValue)
                    .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                    .foregroundColor(selectedTab == tab ? .green : .gray)
                    .font(.system(size: 22))
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.1)) {
                            selectedTab = tab
                        }
                    }
                    Spacer()
                    
                }
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(20)
            .padding()
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(selectedTab: .constant(.house))
    }
}
