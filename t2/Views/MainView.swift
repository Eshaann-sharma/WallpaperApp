//
//  MainView.swift
//  t2
//
//  Created by Eshaan Sharma on 16/09/23.
//

import SwiftUI

struct MainView: View {
    init(){
        UITabBar.appearance().isHidden = true
    }
    @State var currentTab:Tab = .home
    var body: some View {
        VStack{
            TabView(selection: $currentTab){
                ContentView()
                    .tag(Tab.home)
                SearchView()
                    .tag(Tab.search)
                FavView()
                    .tag(Tab.fav)
            }
            CustomTabBar(currentTab: $currentTab)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
