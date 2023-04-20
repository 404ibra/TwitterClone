//
//  SideMenuView.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 18.04.2023.
//
import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
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
            ForEach(SideMenuViewModel.allCases, id:\.rawValue){viewModel in
                if viewModel == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMenuRowView(viewModel: viewModel )
                    }

                }else if viewModel == .logout {
                    Button {
                        authViewModel.signOut()
                    } label: {
                        SideMenuRowView(viewModel: viewModel)
                    }

                    
                }else{
                    SideMenuRowView(viewModel: viewModel )
                }
                
                
              
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
