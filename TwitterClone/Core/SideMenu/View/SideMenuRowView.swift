//
//  SideMenuRowView.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 18.04.2023.
//

import SwiftUI

struct SideMenuRowView: View {
    let viewModel: SideMenuViewModel
    var body: some View {
        HStack(spacing:16){
            Image(systemName: viewModel.iconName)
                .font(.headline)
                .foregroundColor(.gray)
            Text(viewModel.title)
                .foregroundColor(.black)
                .font(.subheadline)
            Spacer()
        }// HSTack
        .frame(height: 48)
        .padding(.horizontal)
    }
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView(viewModel: .profile)
    }
}
