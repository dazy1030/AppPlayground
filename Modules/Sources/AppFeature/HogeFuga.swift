//
//  HogeFuga.swift
//  Modules
//
//  Created by 小田島 直樹 on 4/19/25.
//

import ComposableArchitecture
import SwiftUI

@Reducer
public struct Hoge {
    @Reducer(state: .equatable)
    public enum Destination {
        case fuga(Fuga)
    }
    
    @ObservableState
    public struct State: Equatable {
        @Presents var destination: Destination.State?
    }
    
    public enum Action: BindableAction {
        case pushButtonPressed
        case destination(PresentationAction<Destination.Action>)
        case binding(BindingAction<State>)
    }
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .pushButtonPressed:
                state.destination = .fuga(.init())
                return .none
            case .destination:
                return .none
            case .binding:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination)
    }
}

public struct HogeView: View {
    @Bindable var store = StoreOf<Hoge>(initialState: .init()) {
        Hoge()
    }
    
    public init() {}
    
    public var body: some View {
        NavigationStack {
            Button("Push") {
                store.send(.pushButtonPressed)
            }
            .navigationDestination(
                item: $store.scope(
                    state: \.destination?.fuga,
                    action: \.destination.fuga
                )
            ) { store in
                FugaView(store: store)
            }
        }
    }
}

@Reducer
public struct Fuga {
    @ObservableState
    public struct State: Equatable {}
    
    public enum Action {
        case onAppear
        case fetchResult1
        case fetchResult2
    }

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { send in
                    @Dependency(\.continuousClock) var clock
                    try await clock.sleep(for: .seconds(1))
                    await send(.fetchResult1)
                }
            case .fetchResult1:
                Task {
                @Dependency(\.dismiss) var dismiss
                    await dismiss()
                }
                return .run { send in
                    @Dependency(\.continuousClock) var clock
                    try await clock.sleep(for: .seconds(1))
                    await send(.fetchResult2)
                }
            case .fetchResult2:
                return .none
            }
        }
    }
}

struct FugaView: View {
    var store: StoreOf<Fuga>
    
    var body: some View {
        Text("Fuga")
            .onAppear {
                store.send(.onAppear)
            }
    }
}

#Preview {
    HogeView()
}
