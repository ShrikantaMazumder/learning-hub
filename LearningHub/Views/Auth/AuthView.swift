//
//  AuthView.swift
//  LearningHub
//
//  Created by Shrikanta Mazumder on 5/10/21.
//

import SwiftUI

struct AuthView: View {
    @State var loginMode = Constants.LoginMode.login
    @State var username = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            
            // logo
            Image(systemName: "book")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 150)
            
            // title
            Text("LearningHub")
            
            Spacer()
            
            // picker
            Picker(selection: $loginMode) {
                Text("Login")
                    .tag(Constants.LoginMode.login)
                Text("Sign up")
                    .tag(Constants.LoginMode.createAccount)
            } label: {
                Text("Hey")
            }
            .pickerStyle(.segmented)

            // form
            if(loginMode == Constants.LoginMode.createAccount) {
                TextField("username", text: $username)
            }
            TextField("email", text: $email)
            SecureField("password", text: $password)
            
            // button
            Button {
                if loginMode == Constants.LoginMode.login {
                    // perform login action
                } else {
                    // perform signup/create account action
                }
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(height: 40)
                        .cornerRadius(10)
                    if loginMode == Constants.LoginMode.login {
                        Text("Login")
                            .foregroundColor(.white)
                    } else {
                        Text("Sign up")
                            .foregroundColor(.white)
                    }
                }
            }
            Spacer()
            

        }
        .padding(.horizontal, 40)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
