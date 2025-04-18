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
    @Reducer
    public enum Destination {
        case rootTab(RootTab)
    }
    
    @ObservableState
    public struct State: Equatable {
        var destination: Destination.State
    }
    
    public enum Action {
        case destination(Destination.Action)
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Scope(state: \.destination, action: \.destination) {
            Destination.body
        }
    }
}

extension AppReducer.Destination.State: Equatable {}

extension AppReducer.State {
    public static var initial: Self {
        .init(destination: .rootTab(.initial))
    }
}

public struct AppView: View {
    var store: StoreOf<AppReducer>
    
    public init(store: StoreOf<AppReducer>) {
        self.store = store
    }
    
    public var body: some View {
        switch store.scope(state: \.destination, action: \.destination).case {
        case let .rootTab(rootTabStore):
            RootTabView(store: rootTabStore)
        }
    }
}

#Preview {
    let store = StoreOf<AppReducer>(initialState: AppReducer.State.initial) {
        AppReducer()
    }
    AppView(store: store)
}
