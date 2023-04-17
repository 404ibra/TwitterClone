//
//  MainTabView.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 17.04.2023.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectionIndex: Int = 0
    var body: some View {
        TabView(selection: $selectionIndex) {
            FeedView()
                .onTapGesture {
                    self.selectionIndex = 0
                }
                .tabItem {
                    Image(systemName: IconAssets.MainTabEnums.house.rawValue)
                }.tag(0)
            //TabItem
            ExploreView()
                .onTapGesture {
                    self.selectionIndex = 1
                }
                .tabItem {
                    Image(systemName: IconAssets.MainTabEnums.search.rawValue)
                }.tag(1)
            //TabItem
            NotificationsView()
                .onTapGesture {
                    self.selectionIndex = 2
                }
                .tabItem {
                    Image(systemName: IconAssets.MainTabEnums.notification.rawValue)   }.tag(2)
            //TabItem
            MessagesView()
                .onTapGesture {
                    self.selectionIndex = 3
                }
                .tabItem {
                    Image(systemName: IconAssets.MainTabEnums.messages.rawValue)
                }.tag(3)
            //TabItem
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
