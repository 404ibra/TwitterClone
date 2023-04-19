//
//  TweetsRowView.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 17.04.2023.
//

import SwiftUI

struct TweetsRowView: View {
    var body: some View {
        VStack(alignment: .leading){
            // profile img , user info, tweet and tweet actions
            HStack(alignment: .top, spacing: 12){
                Circle()
                    .frame(height: 56)
                    .foregroundColor(.blue)
                
                //user info & tweet caption
                VStack(alignment: .leading, spacing: 4){
                    //user and date caption
                    HStack{
                        Text("İbrahim")
                            .font(.subheadline).bold()
                        Text("@ibra")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("3w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }//: HStack
                    
                    Text("Mobil geliştirmede çok fazla ilerlemek istiyorum ve güzel girişmlerde bulunacağıma inanıyorum")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                    
                }//: VStack
                
            }//: HStack
          
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

struct TweetsRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetsRowView()
    }
}
