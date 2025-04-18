//
//  AppView.swift
//  Modules
//
//  Created by 小田島 直樹 on 4/18/25.
//

import ComposableArchitecture
import HomeFeature
import MyPageFeature
import SwiftUI

@Reducer
public struct AppReducer {
    @ObservableState
    public struct State: Equatable {
        var home: Home.State
        var myPage: MyPage.State
        var tabSelection: Int
    }
    
    public enum Action: BindableAction {
        case home(Home.Action)
        case myPage(MyPage.Action)
        case binding(BindingAction<State>)
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Scope(state: \.home, action: \.home) {
            Home()
        }
        Scope(state: \.myPage, action: \.myPage) {
            MyPage()
        }
        BindingReducer()
    }
}

extension AppReducer.State {
    public static var initial: Self {
        .init(home: .initial, myPage: .initial, tabSelection: 0)
    }
}

public struct AppView: View {
    @Bindable var store: StoreOf<AppReducer>
    
    public init(store: StoreOf<AppReducer>) {
        self.store = store
    }
    
    public var body: some View {
        TabView(selection: $store.tabSelection) {
            NavigationStack {
                HomeView(store: store.scope(state: \.home, action: \.home))
            }
            .tabItem {
                let imageName = store.tabSelection == 0 ? "house.fill" : "house"
                Image(systemName: imageName)
            }
            .tag(0)
            
            NavigationStack {
                MyPageView(store: store.scope(state: \.myPage, action: \.myPage))
            }
            .tabItem {
                let imageName = store.tabSelection == 1 ? "person.fill" : "person"
                Image(systemName: imageName)
            }
            .tag(1)
        }
        .tabViewStyle(.automatic)
    }
}

#Preview {
    let store = StoreOf<AppReducer>(initialState: AppReducer.State.initial) {
        AppReducer()
    }
    AppView(store: store)
}
