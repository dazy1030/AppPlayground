//
//  HomeView.swift
//  Modules
//
//  Created by 小田島 直樹 on 4/18/25.
//

import ComposableArchitecture
import SwiftUI

@Reducer
public struct Home {
    public struct State: Equatable {
        
    }
    
    public enum Action {
        
    }
    
    public init() {}
}

public extension Home.State {
    static var initial: Self{
        .init()
    }
}

public struct HomeView: View {
    var store: StoreOf<Home>
    
    public init(store: StoreOf<Home>) {
        self.store = store
    }
    
    public var body: some View {
        Text("Home")
            .navigationTitle("Home")
    }
}

#Preview {
    let store = StoreOf<Home>(initialState: Home.State.initial) {
        Home()
    }
    HomeView(store: store)
}
