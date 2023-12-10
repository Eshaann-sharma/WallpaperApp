//
//  TabView.swift
//  t2
//
//  Created by Eshaan Sharma on 16/09/23.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var currentTab:Tab
    var body: some View {
        GeometryReader{ proxy in
            HStack{
                Image("house").resizable().frame(width: 10,height: 10)
                ForEach(Tab.allCases,id:\.rawValue){tab in
                    Button{
                        withAnimation(.easeIn(duration: 0.2)){
                            currentTab = tab
                        }
                    }label: {
                        Image(systemName:tab.rawValue)
//                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24,height: 24)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? .white : .gray)
                    }
                }
            }.frame(maxWidth: .infinity).padding(.top)
        }
        .frame(height: 35)
    }
}

