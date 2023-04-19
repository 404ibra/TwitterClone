//
//  UserStatsView.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 18.04.2023.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack{
            HStack(alignment: .center){
                Text("88")
                    .font(.subheadline)
                    .bold()
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            HStack(alignment: .center){
                Text("404")
                    .font(.subheadline)
                    .bold()
                Text("Follower")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }// HStack
        .padding(.vertical)    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
