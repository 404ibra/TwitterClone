//
//  UserService.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 21.04.2023.
//

import Firebase
import FirebaseFirestoreSwift
struct UserService {
    
    
    func fetchUser(withUid uid: String, completion: @escaping(User)-> Void){
        Firestore.firestore().collection("Users")
            .document(uid)
            .getDocument { snapshot , _  in
                guard let snapshot = snapshot else {return}
                
                guard let user = try? snapshot.data(as: User.self) else {return}
                
                completion(user)
            }
    }
}
