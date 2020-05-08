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
    @State var show = false
    @State var showProfile = false
    
    var body: some View {

        ZStack {
            
            HomeList()
                .blur(radius: show ? 20 : 0)
                .scaleEffect(showProfile ? 0.95 : 1)
                .animation(.default)
           
            ContentView()
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring())
                .offset(y: showProfile ? 40 : UIScreen.main.bounds.height)
            
            MenuButton(show: $show)
                .offset(x: -30, y: showProfile ? 0 : 80)
                .animation(.spring())
            
            MenuRight(show: $showProfile)
                .offset(x: -16, y: showProfile ? 0 : 88)
                .animation(.spring())

            
//the $ means that it is going to listen to the changes and it is going to synchronize
            MenuView(show: $show)
        }
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


struct MenuView: View {
     var menu = menuData
//this binding means that the component is going to listen to the state from the parent component
    @Binding var show : Bool
    
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
        .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
        .animation(.default)
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
        .onTapGesture {
            self.show.toggle()
        }
    }
}

struct CircleButton: View {
    var icon = "person.crop.circle"
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.black)
        }
        .frame(width: 44, height: 44)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
    }
}

struct MenuButton: View {
    @Binding var show : Bool
    var body: some View {
        ZStack(alignment: .topLeading) {
                Button(action: {self.show.toggle()}) {
                    HStack {
                        Spacer()
                        Image(systemName: "list.dash")
                            .foregroundColor(.black)
                    }
                    .padding(.trailing, 20)
                    .frame(width: 90, height: 60)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

struct MenuRight: View {
    @Binding var show : Bool
    var body: some View {
        ZStack {
            HStack {
                Button(action: {self.show.toggle()}) {
                    CircleButton(icon: "person.crop.circle")
                }
                Button(action: {self.show.toggle()}) {
                    CircleButton(icon: "bell")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
    }
}
