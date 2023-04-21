//
//  User.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 21.04.2023.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    
}
