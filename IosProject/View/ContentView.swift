//
//  ContentView.swift
//  IosProject
//
//  Created by Victor  TRAN on 22/01/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.eventArray, id: \.eventName) { event in
                NavigationLink(destination: DetailView(event: event)) {
                    ListRow(event: event)
                }
            }
            .navigationTitle("Event Schedule")
       }
    }
}

#Preview {
    ContentView()
}
