//
//  UserRowView.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 18.04.2023.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12){
            Circle()
                .frame(height: 48)
                .foregroundColor(.black)
            VStack(alignment:.leading){
                Text("İbrahim")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)
                
                Text("@abribra")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }.padding(.horizontal)
            .padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
