//
//  ProfilePhotoSelectorView.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 20.04.2023.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage:UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack{
            AuthenticationHeader(title1: "Setup account", title2: "Add a profile photo")
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                }else{
                    Image("add.image").resizable()
                        .renderingMode(.template)
                    
                        .modifier(ProfileImageModifier())
                }
            }.sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            .padding(.top,44)
            if let selectedImage = selectedImage{
                VStack {
                    Spacer()
                    Button {
                        viewModel.uploadProfileImage(selectedImage)
                    } label: {
                        Text("Continue")
                            .font(.headline)
                            .frame(width:340, height: 50)
                            .background(.blue)
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                            .padding()
                    }
                .shadow(color: .gray.opacity(0.5),radius: 10, x:0, y:0)
                .padding(.bottom)
                }

        }
            Spacer()
        }//VStack
        .ignoresSafeArea()
    }
    func loadImage(){
        guard let selectedImage = selectedImage else{return}
        profileImage = Image(uiImage: selectedImage)
    }
    
}
private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
            .scaledToFit()
            .frame(height: 160)
            .frame(width: 160)
            .clipShape(Circle())
    }
}



struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
