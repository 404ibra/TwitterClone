//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 19.04.2023.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser: Bool = false
    private var tempUserSession: FirebaseAuth.User?
    init(){
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let user = result?.user else {return}
            self.userSession = user
            print("user logged in")
        }
    }
    
    
    func register(withEmail email: String, password: String, username: String, fullname: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Some errors : \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else {return}
            self.tempUserSession = user
            print("register is completed")
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("Users").document(user.uid).setData(data) {_ in
                self.didAuthenticateUser = true
            }
            
        }
    }
    
    func signOut(){
        //sets user session to nil  so we show login screen
        userSession = nil
        
        //signs user out on servers
        try? Auth.auth().signOut()
    }
    func uploadProfileImage(_ image: UIImage){
        guard let uid = tempUserSession?.uid else {return}
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users").document(uid).updateData(["profileImageUrl" : profileImageUrl]){_ in
                self.userSession = self.tempUserSession
            }
        }
    }
}
