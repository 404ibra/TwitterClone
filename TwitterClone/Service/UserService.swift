//
//  UserService.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 21.04.2023.
//

import Firebase

struct UserService {
    
    func fetchUser(withUid uid: String){
        Firestore.firestore().collection("Users")
            .document(uid)
            .getDocument { snapshot , _  in
                guard let data = snapshot?.data() else {return}
                
                print("debug : \(data)")
            }
    }
}
