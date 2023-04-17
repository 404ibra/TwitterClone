//
//  Tweets.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 17.04.2023.
//

import Foundation


struct IconAssets{
    enum TweetEnums: String{
        case commnets = "bubble.left"
        case retweet = "arrow.2.squarepath"
        case fav = "heart"
        case bookmark = "bookmark"
    }
    enum MainTabEnums: String {
        case house = "house"
        case search = "magnifyingglass"
        case notification = "bell"
        case messages = "envelope"
    }
    
    enum ProfileViewsEnums: String {
        case notification = "bell.badge"
        case verificationAccount = "checkmark.seal.fill"
        case location = "mappin.and.ellipse"
        case link = "link"
    }
}
