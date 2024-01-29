//
//  ContentView.swift
//  IosProject
//
//  Created by Victor  TRAN on 22/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel: ViewModel
    var body: some View {
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
    ContentView()
}
