//
//  SideMenuView.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 18.04.2023.
//
import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        if let user = authViewModel.currentUser  {
            VStack(alignment: .leading, spacing: 32){
                VStack(alignment: .leading){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(height: 48)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading){
                        Text(user.fullname)
                            .font(.headline)
                        Text("@\(user.username)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    UserStatsView()
                }//VStack
                .padding(.horizontal)
                ForEach(SideMenuViewModel.allCases, id:\.rawValue){viewModel in
                    if viewModel == .profile {
                        NavigationLink {
                            ProfileView(user: user)
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
}
struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
