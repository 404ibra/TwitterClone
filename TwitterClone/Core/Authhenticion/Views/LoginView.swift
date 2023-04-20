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
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack{
            
        AuthenticationHeader(title1: "Hello", title2: "Welcome back...")
 
            VStack(spacing: 40){
                CustomInputFields(imageName: "envelope", placeHolder: "Email", text: $email)
                CustomInputFields(imageName: "lock",
                                  placeHolder: "Password",
                                  isSecureField: true,
                                  text: $password)
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
                viewModel.login(withEmail: email, password: password)
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
