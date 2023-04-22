//
//  ExploreViewModels.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 22.04.2023.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
        }else {
            let lowerCaseQuery = searchText.lowercased()
            
            return users.filter({
                $0.username.contains(lowerCaseQuery) ||
                $0.fullname.lowercased().contains(lowerCaseQuery)
            })
        }
    }
    
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
