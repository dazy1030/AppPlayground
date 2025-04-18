//
//  AppView.swift
//  Modules
//
//  Created by 小田島 直樹 on 4/18/25.
//

import SwiftUI

public struct AppView: View {
    public init() {}
    
    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    AppView()
}
