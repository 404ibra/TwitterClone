//
//  ProfileView.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 17.04.2023.
//

import SwiftUI
import Kingfisher
 
struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    private let user: User
    
    init(user: User){
        self.user = user
    }
    
    var body: some View {
        VStack(alignment: .leading){
            headerView
            actionButtons
            userInfoDetails
            tweetFilterBar
            ScrollView{
                LazyVStack{
                    ForEach(0...9, id:\.self){_ in
                        TweetsRowView()
                            .padding()
                    }
                }
            }
            Spacer()
        }//: Big VStack
    }
}



extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading){
            Color(.systemBlue)
                .ignoresSafeArea()
            VStack{
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20,height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 12)
                }

                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(height: 72)
                    .clipShape(Circle())
                    .offset(x: 16, y: 24)
            }// Vstack
        }//ZStack
        .frame(height: 88)
    }
    
    var actionButtons: some View {
        HStack (spacing: 12){
            Spacer()
            Image(systemName: IconAssets.ProfileViewsEnums.notification.rawValue)
                .font(.title3)
                .padding(6)
                .overlay(
                    Circle()
                        .stroke(.gray, lineWidth: 0.75))
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)
                    .frame(width: 120, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray, lineWidth: 0.75))
                 
            }
            .padding(.trailing)

        }
    }
    
    var userInfoDetails: some View {
        VStack(alignment: .leading){
            HStack{
                Text(user.fullname)
                    .font(.title2).bold()
                Image(systemName: IconAssets.ProfileViewsEnums.verificationAccount.rawValue)
                    .foregroundColor(.blue)
            }
            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Swift, Flutter, Google")
                .font(.subheadline)
                .padding(.vertical)
            HStack(spacing:24){
                HStack{
                    Image(systemName: IconAssets.ProfileViewsEnums.location.rawValue)
                    Text("Bandırma")
                }
                HStack{
                    Image(systemName: IconAssets.ProfileViewsEnums.link.rawValue)
                    Text("www.abribra.com")
                }
            }//: HStack
            .font(.caption)
             .foregroundColor(.gray)
            
            
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
            .padding(.vertical)
            
            
        }//: VStack
        .padding(.horizontal)
    }
    
    var tweetFilterBar: some View{
        HStack {
            ForEach(TweetFilterViewModel.allCases, id:\.rawValue){item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(.blue)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                           
                    }else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                    
                }//VStack
                .onTapGesture {
                    withAnimation(.easeInOut){
                        self.selectedFilter = item
                    }
                }
            }

        }//: HStack
        .overlay(Divider().offset(x:0 , y:16))
    }
}
