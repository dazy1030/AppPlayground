//
//  MyPageView.swift
//  Modules
//
//  Created by 小田島 直樹 on 4/18/25.
//

import ComposableArchitecture
import SwiftUI

@Reducer
public struct MyPage {
    public struct State: Equatable {
        
    }
    
    public enum Action {
        case onAppear
        case logoutButtonPressed
    }
    
    public init() {}
}

public extension MyPage.State {
    static var initial: Self {
        .init()
    }
}

public struct MyPageView: View {
    var store: StoreOf<MyPage>
    
    public init(store: StoreOf<MyPage>) {
        self.store = store
    }
    
    public var body: some View {
        VStack {
            Text("MyPage")
            Button("Logout") {
                store.send(.logoutButtonPressed)
            }
        }
        .navigationTitle("MyPage")
        .onAppear {
            store.send(.onAppear)
        }
    }
}

#Preview {
    let store = StoreOf<MyPage>(initialState: MyPage.State()) {
        MyPage()
    }
    MyPageView(store: store)
}
