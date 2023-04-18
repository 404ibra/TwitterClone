//
//  NewTweetsView.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 18.04.2023.
//

import SwiftUI

struct NewTweetsView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
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
                    print("Tweet")
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
             Circle()
                    .frame(height: 64)
                TextArea("What's happening?", text: $caption)
            }
            .padding()
        }//: VStack
    }
}

struct NewTweetsView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetsView()
    }
}
