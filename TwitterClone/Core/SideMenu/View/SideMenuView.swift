//
//  SideMenuView.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 18.04.2023.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 32){
            VStack(alignment: .leading){
                Circle()
                    .frame(height: 48)
                
                VStack(alignment: .leading){
                    Text("İbrahim")
                        .font(.headline)
                    Text("@ibra")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                UserStatsView()
            }//VStack
            .padding(.horizontal)
            ForEach(SideMenuViewModel.allCases, id:\.rawValue){option in
                HStack(spacing:16){
                    Image(systemName: option.iconName)
                        .font(.headline)
                        .foregroundColor(.gray)
                    Text(option.title)
                        .font(.subheadline)
                    Spacer()
                }// HSTack
                .frame(height: 48)
                .padding(.horizontal)
            }//BIG VSTACK
            Spacer()
        }
    }
}
struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
