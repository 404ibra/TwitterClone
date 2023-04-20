//
//  CustomInputFields.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 19.04.2023.
//

import SwiftUI

struct CustomInputFields: View {
    let imageName: String
    let placeHolder: String
    var isSecureField: Bool? = false
    @Binding var text: String
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                    .foregroundColor(Color(.darkGray))
                if isSecureField ?? false {
                    SecureField(placeHolder, text: $text)
                }else{
                    TextField(placeHolder, text: $text)
                }
            }//HStack
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomInputFields_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputFields(imageName: "envelope",
                          placeHolder: "Email",
                          text: .constant(""))
    }
}
