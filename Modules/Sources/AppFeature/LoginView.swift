//
//  LoginView.swift
//  Modules
//
//  Created by 小田島 直樹 on 4/18/25.
//

import ComposableArchitecture
import SwiftUI

@Reducer
public struct Login {
    @ObservableState
    public struct State: Equatable {
        
    }
    
    public enum Action {
        case loginButtonPressed
    }
}

extension Login.State {
    static var initial: Self {
        .init()
    }
}

struct LoginView: View {
    var store: StoreOf<Login>
    
    var body: some View {
        Button("Login") {
            store.send(.loginButtonPressed)
        }
    }
}
