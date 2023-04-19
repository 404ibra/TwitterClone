//
//  LoginView.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 19.04.2023.
//

import SwiftUI

struct LoginView: View {
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
            Spacer()
        }//VStack
        .ignoresSafeArea()
      
        }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
