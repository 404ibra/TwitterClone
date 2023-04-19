//
//  AuthenticationHeader.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 19.04.2023.
//

import SwiftUI

struct AuthenticationHeader: View {
    let title1: String
    let title2: String
    var body: some View {
        VStack(alignment: .leading){
            HStack{Spacer()}
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .padding(.leading)
        .frame(height: 260)
        .background(.blue)
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))

    }
}

struct AuthenticationHeader_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationHeader(title1: "Heellooo", title2: "dsadsa")
    }
}
