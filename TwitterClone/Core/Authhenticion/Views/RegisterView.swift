//
//  RegisterView.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 19.04.2023.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var mode
    var body: some View {
        VStack{
            
           AuthenticationHeader(title1: "Get started", title2: "Create your account")
          
            VStack(spacing: 40){
                CustomInputFields(imageName: "envelope", placeHolder: "Email", text: $email)
            CustomInputFields(imageName: "person", placeHolder: "Username", text: $username)
            CustomInputFields(imageName: "person", placeHolder: "Fullname", text: $fullname)
            CustomInputFields(imageName: "lock", placeHolder: "Password", text: $password)
            }.padding(32)
            
            
            Button {
                print("Sign Up")
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .frame(width:340, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5),radius: 10, x:0, y:0)

            Spacer()
            Button {
                mode.wrappedValue.dismiss()
            } label: {
                HStack{
                    Text("Already have an account ? ")
                        .font(.footnote)
                    Text("Sign In ")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .padding(.bottom, 32)
                .foregroundColor(.blue)
            }
 
        }.ignoresSafeArea()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
