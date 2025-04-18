//
//  AppView.swift
//  Modules
//
//  Created by 小田島 直樹 on 4/18/25.
//

import HomeFeature
import MyPageFeature
import SwiftUI

public struct AppView: View {
    @State var tabSelection: Int = 0
    
    public init() {}
    
    public var body: some View {
        TabView(selection: $tabSelection) {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                let imageName = tabSelection == 0 ? "house.fill" : "house"
                Image(systemName: imageName)
            }
            .tag(0)
            
            NavigationStack {
                MyPageView()
            }
            .tabItem {
                let imageName = tabSelection == 1 ? "person.fill" : "person"
                Image(systemName: imageName)
            }
            .tag(1)
        }
        .tabViewStyle(.automatic)
    }
}

#Preview {
    AppView()
}
