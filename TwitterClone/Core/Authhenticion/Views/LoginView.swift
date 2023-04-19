//
//  LoginView.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 19.04.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        VStack{
            
            VStack(alignment: .leading){
                HStack{Spacer()}
                Text("Hello")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
            .frame(height: 260)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
 
            VStack(spacing: 40){
                TextField("Email", text: $email)
                TextField("Password", text: $password)
            }.padding(.horizontal, 32)
                .padding(.top,44)
            
            HStack{
                Spacer()
                NavigationLink {
                    Text("Reset Password View")
                } label: {
                    Text("Forgot Password")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }
            Button {
                print("Sign in")
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .frame(width:340, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5),radius: 10, x:0, y:0)

            Spacer()
            NavigationLink {
                RegisterView()
                    .navigationBarHidden(true)
            } label: {
                HStack{
                    Text("Don't have an account ? ")
                        .font(.footnote)
                    Text("Sign Up ")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .padding(.bottom, 32)
                .foregroundColor(.blue)
            }

        }//VStack
        .ignoresSafeArea()
        .navigationBarHidden(true)
        
     
        }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
