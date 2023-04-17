//
//  FeedView.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 17.04.2023.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(0...20, id:\.self){_ in

                    TweetsRowView()
                        .padding()
                }
            }//: LazyVGrid
        }//: ScrollView
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
