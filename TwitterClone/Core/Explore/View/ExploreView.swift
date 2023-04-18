//
//  ExploreView.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 17.04.2023.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    LazyVStack{
                        ForEach(0...25, id:\.self){_ in
                            NavigationLink {
                                ProfileView()
                            } label: {
                                UserRowView()
                            }

                        }
                    }
                }
            }// VStack
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }//: NavigationView
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
