//
//  AppPlaygroundApp.swift
//  AppPlayground
//
//  Created by 小田島 直樹 on 4/18/25.
//

import AppFeature
import ComposableArchitecture
import SwiftUI

@main
struct AppPlaygroundApp: App {
    var body: some Scene {
        WindowGroup {
            let store = StoreOf<AppReducer>(initialState: AppReducer.State.initial) {
                AppReducer()
            }
            AppView(store: store)
        }
    }
}
