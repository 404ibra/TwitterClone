//
//  ExploreViewModels.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 22.04.2023.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    let service =  UserService()
    
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        service.fetchUsers { users in
            self.users = users
            
          
        }
    }
    
}
