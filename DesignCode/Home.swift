//
//  Home.swift
//  DesignCode
//
//  Created by Delmarre, Guillaume on 2020/5/5.
//  Copyright © 2020 Delmarre, Guillaume. All rights reserved.
//

import SwiftUI

struct Home: View {
    var menu = menuData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            
            ForEach(menu) {item in
                MenuRow(image: item.icon, text: item.title)
            }


            Spacer()
        }
        .padding(.top, 30)
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing, 60)
        .shadow(radius: 20)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct MenuRow: View {
//use these variables so that the content (icon and title) is not hardcoded
    var image = "creditcard"
    var text = "My Account"
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32, height: 32)
            Text(text)
                .font(.headline)
            Spacer()
        }
    }
}

struct Menu : Identifiable {
    var id: String
    var title : String
    var icon : String
}

let menuData = [
    Menu(id: "account", title: "My Account", icon: "person.crop.circle"),
    Menu(id: "billing", title: "Billing", icon: "creditcard"),
    Menu(id: "team", title: "Team", icon: "person.2.square.stack"),
    Menu(id: "signOut", title: "Sign out", icon: "arrow.uturn.down")
]

