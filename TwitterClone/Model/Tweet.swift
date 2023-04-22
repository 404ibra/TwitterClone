//
//  Tweet.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 22.04.2023.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp : Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
}
