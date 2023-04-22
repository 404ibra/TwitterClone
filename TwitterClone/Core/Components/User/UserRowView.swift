//
//  UserRowView.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 18.04.2023.
//

import SwiftUI
import Kingfisher
struct UserRowView: View {
    let user: User
    var body: some View {
        HStack(spacing: 12){
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFit()
                .frame(height: 48)
                .clipShape(Circle())

            VStack(alignment:.leading){
                Text(user.fullname)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)
                
                Text("@\(user.username)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }.padding(.horizontal)
            .padding(.vertical, 4)
    }
}

