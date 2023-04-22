//
//  NewTweetsView.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 18.04.2023.
//

import SwiftUI
import Kingfisher


struct NewTweetsView: View {
    @State private var caption = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = UploadTweetViewModel()
    
    var body: some View {
        VStack(){
            HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }
                Spacer()
                
                Button {
                    viewModel.uploadTweet(withCaption: caption)
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }


            }//HStack
            .padding()
            HStack(alignment: .top){
                    
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(height: 64)
                        .clipShape(Circle())
                }
                
                
                TextArea("What's happening?", text: $caption)
            }
            .padding()
        }//: VStack
        .onReceive(viewModel.$didUploadTweet) { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewTweetsView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetsView()
    }
}
