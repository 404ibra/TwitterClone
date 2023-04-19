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
    init(){
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String){
        print("login")
    }
    
    
    func register(withEmail email: String, password: String, username: String, fullname: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Some errors : \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else {return}
            self.userSession = user
            print("register is completed")
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("Users").document(user.uid).setData(data) {_ in
                print("did upload user data..")
            }
            
        }
    }
}
