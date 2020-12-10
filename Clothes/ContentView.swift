//
//  ContentView.swift
//  Clothes
//
//  Created by Garrett Johnson on 12/6/20.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct ContentView : View {
    let storedUsername = "User"
    let storedPassword = "12345"
    let color1: Color = Color(red: 0.5, green: 0.5, blue: 1, opacity: 0.6)
    let color2: Color = Color(red: 0, green: 0.8, blue: 1, opacity: 0.9)

    
    @State var username: String = ""
    @State var password: String = ""
    @State var authTrue: Bool   = false
    @State var authFalse:Bool   = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: UnitPoint(x: 0.9, y: 0.9), endPoint: UnitPoint(x: 0.25, y: 0.25))
                    .ignoresSafeArea()
                VStack {
                    NavigationLink(destination: HomeView(), isActive:
                            $authTrue) { EmptyView() }
                    
                    if authTrue {
                        Welcome()
                    }
                    WelcomeIcon()
                    UsernameTextField(username: $username)
                    PasswordSecureField(password: $password)
                    if authFalse {
                        Text("Incorrect Information")
                            .offset(y: -10)
                            .foregroundColor(.red)
                    }
                    Button(action: {
                        if self.username == storedUsername && self.password == storedPassword {
                            self.authTrue = true
                            self.authFalse = false
                        } else {
                            self.authFalse = true
                        }
                    }) {
                        LoginButton()
                    }
                    }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Welcome: View {
    var body: some View {
        Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
            .foregroundColor(.green)
            .animation(Animation.default)
    }
}

struct WelcomeIcon: View {
    var body: some View {
        Image("bow")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 65)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
            .padding(.top, 25)
    }
}

struct LoginButton: View {
    var body: some View {
        Text("Login")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}

struct UsernameTextField: View {
    @Binding var username: String
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct PasswordSecureField: View {
    @Binding var password: String
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}
