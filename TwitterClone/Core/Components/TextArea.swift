//
//  TextArea.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 18.04.2023.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    init(_ placeholder: String, text: Binding<String>){
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            TextEditor(text: $text)
                .padding(4)
        }
        .font(.body)
    }
}
