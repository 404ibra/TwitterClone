//
//  TweetsRowView.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 17.04.2023.
//

import SwiftUI
import Kingfisher


struct TweetsRowView: View {
    let tweet: Tweet
    var body: some View {
        VStack(alignment: .leading){
            // profile img , user info, tweet and tweet actions
            HStack(alignment: .top, spacing: 12){
                if let user = tweet.user {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(height: 56)
                        .clipShape(Circle())
                }
                
                //user info & tweet caption
                VStack(alignment: .leading, spacing: 4){
                    //user and date caption
                    
                    if let user = tweet.user{
                        HStack{
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Text("3w")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }//: HStack
                        
                        Text(tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                        
                    }//: VStack
                    
                }//: HStack
                    }
          
            HStack{
                Button {
                } label: {
                    Image(systemName: IconAssets.TweetEnums.commnets.rawValue)
                        .font(.subheadline)
                }
                Spacer()
                Button {
                } label: {
                    Image(systemName: IconAssets.TweetEnums.retweet.rawValue)
                        .font(.subheadline)
                }
                Spacer()
                Button {
                } label: {
                    Image(systemName: IconAssets.TweetEnums.fav.rawValue)
                        .font(.subheadline)
                }
                Spacer()
                Button {
                } label: {
                    Image(systemName: IconAssets.TweetEnums.bookmark.rawValue)
                        .font(.subheadline)
                }
              
            }
            .padding()
            .foregroundColor(.gray)
            Divider()
            //: HStack
        }//: Big VSTACK
    }
}

