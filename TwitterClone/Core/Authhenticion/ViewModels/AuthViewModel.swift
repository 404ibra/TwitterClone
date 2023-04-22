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
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
    private var userService = UserService()
    init(){
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let user = result?.user else {return}
            self.userSession = user
            self.fetchUser()
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
                print(self.didAuthenticateUser)
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
            print(profileImageUrl)
            Firestore.firestore().collection("Users").document(uid).updateData(["profileImageUrl" : profileImageUrl]){_ in
                self.userSession = self.tempUserSession
                self.fetchUser()
            }
        }
    }
    
    func fetchUser(){
        guard let uid = self.userSession?.uid else {return}
        
        
        userService.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
    
}
